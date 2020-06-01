import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import '../api/weather_api_client.dart';
import '../api/weather_repository.dart';
import 'bloc/bloc.dart';
import 'widget/widget.dart';

class WeatherPage extends StatelessWidget {
  Future<Position> _getPosition() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocProvider(
        create: (context) => WeatherBloc(
          weatherRepository: WeatherRepository(
            weatherApiClient: WeatherApiClient(httpClient: http.Client()),
          ),
        ),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherEmpty) {
              return FutureBuilder<Position>(
                future: _getPosition(),
                builder:
                    (BuildContext context, AsyncSnapshot<Position> snapshot) {
                  if (snapshot.hasData) {
                    final position = snapshot.data;
                    BlocProvider.of<WeatherBloc>(context).add(
                      FetchWeather(
                        lat: position.latitude,
                        long: position.longitude,
                      ),
                    );
                  }

                  return Center(child: Text('請開啟定位功能及權限'));
                },
              );
            }

            if (state is WeatherLoading) {
              return CircularProgressIndicator();
            }

            if (state is WeatherLoaded) {
              final weather = state.weather;

              return RefreshIndicator(
                onRefresh: () async {
                  final Position position = await _getPosition();

                  BlocProvider.of<WeatherBloc>(context).add(
                    RefreshWeather(
                      lat: position.latitude,
                      long: position.longitude,
                    ),
                  );
                },
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 32.0),
                  child: Column(
                    children: <Widget>[
                      RainPercentage(weather: weather),
                      SizedBox(height: 32.0),
                      WeatherInfo(weather: weather),
                      SizedBox(height: 32.0),
                      TomorrowRainPercentage(weather: weather),
                    ],
                  ),
                ),
              );
            }

            if (state is WeatherError) {
              return Text(
                '發生未知錯誤!',
                style: TextStyle(color: Colors.red),
              );
            }

            return Center(child: Text('Please Select a Location'));
          },
        ),
      ),
    );
  }
}
