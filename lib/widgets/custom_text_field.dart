import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final ValueChanged<String> onChanged;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
      onChanged: onChanged,
    );
  }
}
