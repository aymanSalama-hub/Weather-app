import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      body: const Center(
        child: Text('There is no weather 😔 start searching now 🔍'),
      ),
    );
  }
}
