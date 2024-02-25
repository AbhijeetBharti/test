part of 'forecast_weather_bloc.dart';

abstract class ForecastWeatherEvent {}

class FetchWeather extends ForecastWeatherEvent {
  FetchWeather({required this.location});
  String location;
}
