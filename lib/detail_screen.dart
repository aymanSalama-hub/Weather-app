import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/search_screen.dart';
import 'package:weather_app/services/api.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.city}) : super(key: key);
  final String city;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  Weather weatherData = Weather(
    cityName: '',
    temperature: 0,
    minTemperature: 0,
    maxTemperature: 0,
    description: '',
    lastUpdated: '',
    icon: '',
  );

  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  Future<void> getWeatherData() async {
    final data = await WeatherService.getWeatherData(widget.city);
    print(weatherData.icon);
    setState(() {
      weatherData = Weather.fromJson(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    String lastUpdated = weatherData.lastUpdated.split(' ').last;
    log(weatherData.icon);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          'Weather App',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFA500), Color(0xFFFED7AA)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weatherData.cityName,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 28,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Last Updated: $lastUpdated',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 24),
              _buildWeatherInfo(),
              const SizedBox(height: 24),
              Text(
                weatherData.description,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 28,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            'https:${weatherData.icon}',
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
          Text(
            '${weatherData.temperature}°C',
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Max : ${weatherData.maxTemperature.toStringAsFixed(0)}°C',
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
              Text(
                'Min : ${weatherData.minTemperature.toStringAsFixed(0)}°C',
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
