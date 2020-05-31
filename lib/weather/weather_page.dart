import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import '../api/weather_api_client.dart';
import '../api/weather_repository.dart';
import '../common/button.dart';
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
              return Center(
                child: MyTextButton(
                  onPressed: () async {
                    final Position position = await _getPosition();

                    BlocProvider.of<WeatherBloc>(context).add(
                      FetchWeather(
                        lat: position.latitude,
                        long: position.longitude,
                      ),
                    );
                  },
                  text: '請開啟定位功能及權限',
                  color: Colors.black,
                ),
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
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 32.0,
                    horizontal: 16.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RainPercentage(weather: weather),
                      WeatherInfo(weather: weather),
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
