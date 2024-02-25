import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_test/repository/data_model/forecast_weather_data_model.dart';
import 'package:weather_test/repository/network_services/api_error.dart';
import 'package:weather_test/repository/network_services/api_result.dart';
import 'package:weather_test/repository/network_services/network_services.dart';

part 'forecast_weather_event.dart';
part 'forecast_weather_state.dart';

class ForecastWeatherBloc
    extends Bloc<ForecastWeatherEvent, ForecastWeatherState> {
  ForecastWeatherBloc() : super(Fetching()) {
    on<FetchWeather>(_fetchWeather);
  }

  _fetchWeather(FetchWeather event, Emitter<ForecastWeatherState> emit) async {
    emit(Fetching());
    try {
      ApiResult<ForecastWeatherModel> result =
          await NetworkServices().getForecastWeather(event.location);
      emit(WeatherFetched(data: result.data));
    } on ApiError catch (e) {
      emit(Failed(errorMessage: e.errorMessage));
    }
  }
}
