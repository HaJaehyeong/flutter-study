import 'package:flutter/material.dart';

class SigninViewModel {
  String _id = '';
  String _password = '';

  void setId(String value) => _id = value;
  void setPassword(String value) => _password = value;

  void login(BuildContext context) async {
    // TODO(hajae): Login Logic
  }
}
