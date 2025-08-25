import 'package:flutter/material.dart';
import 'package:weather_app/detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController cityController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search City")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                textInputAction: TextInputAction.search,
                onFieldSubmitted: (value) {
                  if (formKey.currentState!.validate()) {
                    var city = cityController.text.trim();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (contex) => DetailsScreen()),
                    );
                  }
                },
                controller: cityController,
                decoration: InputDecoration(
                  hintText: 'Enter City Name',
                  prefixIcon: IconButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        var city = cityController.text.trim();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (contex) => DetailsScreen(),
                          ),
                        );
                      }
                    },
                    icon: Icon(Icons.search),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter City Name';
                  }

                  if (value.trim().length < 2) {
                    return 'City Name is too short';
                  }

                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
