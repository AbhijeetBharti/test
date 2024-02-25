import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_test/repository/data_model/real_time_weather_data_model.dart';
import 'package:weather_test/repository/network_services/api_error.dart';
import 'package:weather_test/repository/network_services/api_result.dart';
import 'package:weather_test/repository/network_services/network_services.dart';

part 'real_time_weather_event.dart';
part 'real_time_weather_state.dart';

class RealTimeWeatherBloc
    extends Bloc<RealTimeWeatherEvent, RealTimeWeatherState> {
  RealTimeWeatherBloc() : super(Fetching()) {
    on<FetchWeather>(_fetchWeather);
  }

  _fetchWeather(FetchWeather event, Emitter<RealTimeWeatherState> emit) async {
    emit(Fetching());
    try {
      ApiResult<RealTimeWeatherModel> result =
          await NetworkServices().getRealTimeWeather(event.location);
      emit(WeatherFetched(data: result.data));
    } on ApiError catch (e) {
      emit(Failed(errorMessage: e.errorMessage));
    }
  }
}
