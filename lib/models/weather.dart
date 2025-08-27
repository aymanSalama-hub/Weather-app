class Weather {
  final String cityName;
  final double temperature;
  final double minTemperature;
  final double maxTemperature;
  final String description;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.minTemperature,
    required this.maxTemperature,
    required this.description,
  });
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      minTemperature: json['main']['temp_min'].toDouble(),
      maxTemperature: json['main']['temp_max'].toDouble(),
      description: json['weather'][0]['description'],
    );
  }
}
