import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherService {
  static const String apikey = '45757dc1546ec7c3d97101e4f9b3c828';
  static const String url = 'https://api.openweathermap.org/data/2.5/weather';

  static Future<Map<String, dynamic>> getWeatherData(String city) async {
    final respone = await http.get(
      Uri.parse('$url?q=$city&appid=$apikey&units=metric'),
    );
    if (respone.statusCode == 200) {
      return jsonDecode(respone.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
