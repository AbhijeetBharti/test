part of 'forecast_weather_bloc.dart';

abstract class ForecastWeatherState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Fetching extends ForecastWeatherState {}

class Failed extends ForecastWeatherState {
  Failed({required this.errorMessage});

  final String errorMessage;
}

class WeatherFetched extends ForecastWeatherState {
  WeatherFetched({required this.data});
  final ForecastWeatherModel data;
}
