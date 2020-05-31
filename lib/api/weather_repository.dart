import 'package:meta/meta.dart';

import '../model/weather.dart';
import 'weather_api_client.dart';

class WeatherRepository {
  final WeatherApiClient weatherApiClient;

  WeatherRepository({@required this.weatherApiClient})
      : assert(weatherApiClient != null);

  Future<Weather> getWeather(double lat, double long) async {
    final int locationId = await weatherApiClient.getLocationId(lat, long);
    return weatherApiClient.getWeather(locationId);
  }
}
