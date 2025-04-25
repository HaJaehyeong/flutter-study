import 'package:vertical_factory/models/auth_response.dart';
import 'package:vertical_factory/services/auth_service.dart';

class SigninViewModel {
  String _id = '';
  String _password = '';

  final AuthService _authService = AuthService();

  void setId(String value) => _id = value;
  void setPassword(String value) => _password = value;

  Future<AuthResponse> login() async {
    return await _authService.login(username: _id, password: _password);
  }
}
