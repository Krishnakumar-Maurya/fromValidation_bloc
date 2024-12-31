import 'package:flutter/material.dart';

class PhoneWidget extends StatelessWidget {
  final String phone;
  final Function(String) onChanged;

  const PhoneWidget({required this.phone, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Phone',
          border: OutlineInputBorder(),
        ),
        initialValue: phone,
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your phone number';
          }
          if (!RegExp(r'^\d{10}$').hasMatch(value)) {
            return 'Please enter a valid phone number';
          }
          return null;
        },
      ),
    );
  }
}
