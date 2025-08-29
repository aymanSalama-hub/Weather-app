class Weather {
  final String cityName;
  final double temperature;
  final double minTemperature;
  final double maxTemperature;
  final String description;
  final String lastUpdated;
  final String icon;

  Weather({
    required this.lastUpdated,
    required this.icon,
    required this.cityName,
    required this.temperature,
    required this.minTemperature,
    required this.maxTemperature,
    required this.description,
  });
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['location']['name'],
      temperature: json['current']['temp_c'],
      minTemperature: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxTemperature: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      description: json['current']['condition']['text'],
      icon: json['current']['condition']['icon'],
      lastUpdated: json['current']['last_updated'],
    );
  }
}
