import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/services/api.dart';
import 'package:weather_app/models/weather.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());
  late Weather weatherData;
  late String cityName;
  Future<void> getWeather(String city) async {
    cityName = city;
    try {
      final data = await WeatherService.getWeatherData(city);
      weatherData = Weather.fromJson(data);
      emit(WeatherLoadingState());
    } catch (e) {
      emit(WeathererrorState());
    }
  }
}
