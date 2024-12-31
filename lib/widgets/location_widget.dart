import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  final String country;
  final String state;
  final String city;
  // final Focus? focus;
  final Function(String, String, String) onChanged;

  const LocationWidget({super.key, 
    required this.country,
    required this.state,
    required this.city,
    required this.onChanged,
    // this.focus
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextFormField(
            decoration:const InputDecoration(
              labelText: 'Country',
              border: OutlineInputBorder(),
            ),
            initialValue: country,
            onChanged: (value) => onChanged(value, state, city),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your country';
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextFormField(
            decoration:const InputDecoration(
              labelText: 'State',
              border: OutlineInputBorder(),
            ),
            initialValue: state,
            onChanged: (value) => onChanged(country, value, city),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your state';
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextFormField(
            onFieldSubmitted: (_) {
              FocusScope.of(context).unfocus(); // Remove focus from all fields
            },
            decoration:const InputDecoration(
              labelText: 'City',
              border: OutlineInputBorder(),
            ),
            initialValue: city,
            onChanged: (value) => onChanged(country, state, value),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your city';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
