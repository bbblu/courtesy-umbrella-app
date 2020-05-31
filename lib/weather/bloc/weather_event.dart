import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherEvent {
  final double lat;
  final double long;

  const FetchWeather({
    @required this.lat,
    @required this.long,
  }) : assert(lat != null, long != null);

  @override
  List<Object> get props => [lat, long];
}

class RefreshWeather extends WeatherEvent {
  final double lat;
  final double long;

  const RefreshWeather({
    @required this.lat,
    @required this.long,
  }) : assert(lat != null, long != null);

  @override
  List<Object> get props => [lat, long];
}
