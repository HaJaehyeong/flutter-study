import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:vertical_factory/models/auth_response.dart';

class AuthService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://nestbaroapi-dot-prd-barofactory.du.r.appspot.com',
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future<AuthResponse> login({
    required String username,
    required String password,
  }) async {
    final hashedPassword = sha256.convert(utf8.encode(password)).toString();

    try {
      final response = await _dio.post(
        '/login',
        data: {'username': username, 'password': hashedPassword},
      );

      final data = response.data;

      if (data['success'] != true) {
        throw Exception(data['message'] ?? 'Login failed');
      }

      return AuthResponse.fromJson(data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Network error');
    }
  }
}
