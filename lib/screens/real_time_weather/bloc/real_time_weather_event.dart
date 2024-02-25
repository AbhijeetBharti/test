part of 'real_time_weather_bloc.dart';

abstract class RealTimeWeatherEvent {}

class FetchWeather extends RealTimeWeatherEvent {
  FetchWeather({required this.location});
  String location;
}
