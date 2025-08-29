import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherService {
  static const String apikey = 'b5f346a8f33f4915b2b184158252708';
  static const String url = 'http://api.weatherapi.com/v1/forecast.json';

  static Future<Map<String, dynamic>> getWeatherData(String city) async {
    final respone = await http.get(
      Uri.parse('$url?key=$apikey&q=$city&days=1'),
    );
    if (respone.statusCode == 200) {
      return jsonDecode(respone.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
