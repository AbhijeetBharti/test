part of 'real_time_weather_bloc.dart';

abstract class RealTimeWeatherState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Fetching extends RealTimeWeatherState {}

class Failed extends RealTimeWeatherState {
  Failed({required this.errorMessage});

  final String errorMessage;
}

class WeatherFetched extends RealTimeWeatherState {
  WeatherFetched({required this.data});
  final RealTimeWeatherModel data;
}
