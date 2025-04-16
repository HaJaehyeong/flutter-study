import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

// NOTE(hajae): Response Class
class AuthInfo {
  final String enterprise;
  final int enterpriseId;
  final String token;
  final String name;

  AuthInfo({
    required this.enterprise,
    required this.enterpriseId,
    required this.name,
    required this.token,
  });

  // NOTE(hajae): JSON to Object
  factory AuthInfo.fromJson(Map<String, dynamic> json) {
    return AuthInfo(
      enterprise: json['enterprise'],
      enterpriseId: int.parse(json['enterprise_id'].toString()),
      name: json['name'],
      token: json['token'],
    );
  }
}

class AuthService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://nestbaroapi-dot-prd-barofactory.du.r.appspot.com',
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future<AuthInfo> login({
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

      return AuthInfo.fromJson(data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Network error');
    }
  }
}
