import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final void Function(String)? onChanged;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onChanged: onChanged,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        labelText: hintText,
        border: const UnderlineInputBorder(),
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.grey,
        ),
        floatingLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Color(0xFF18a0fb),
        ),
        isDense: true,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFee5d50)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF18a0fb), width: 2),
        ),
      ),
    );
  }
}
