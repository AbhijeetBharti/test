import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:weather_test/constants/url.dart';
import 'package:weather_test/repository/data_model/forecast_weather_data_model.dart';
import 'package:weather_test/repository/data_model/real_time_weather_data_model.dart';
import 'package:weather_test/repository/network_services/api_error.dart';
import 'package:weather_test/repository/network_services/api_result.dart';

class NetworkServices {
  static const _apiKey = '2aj7QwO7BAn76KjXQ6V8Ww5QMcPefSJU';

  Future<ApiResult<RealTimeWeatherModel>> getRealTimeWeather(
      String location) async {
    try {
      final Response response = await http.get(
          Uri.parse('$realTimeWeatherApi?location=$location&apikey=$_apiKey'));
      if (response.statusCode == 200) {
        return ApiResult(
            data: realTimeWeatherModelFromJson(response.body),
            statusCode: response.statusCode);
      } else {
        throw ApiError(
            errorMessage: response.body.toString(),
            statusCode: response.statusCode);
      }
    } catch (e) {
      throw ApiError(errorMessage: e.toString(), statusCode: 000);
    }
  }

  Future<ApiResult<ForecastWeatherModel>> getForecastWeather(
      String location) async {
    try {
      final Response response = await http.get(
          Uri.parse('$forecastWeatherApi?location=$location&apikey=$_apiKey'));
      if (response.statusCode == 200) {
        return ApiResult(
            data: forecastWeatherModelFromJson(response.body),
            statusCode: response.statusCode);
      } else {
        throw ApiError(
            errorMessage: response.body.toString(),
            statusCode: response.statusCode);
      }
    } catch (e) {
      throw ApiError(errorMessage: e.toString(), statusCode: 000);
    }
  }
}
