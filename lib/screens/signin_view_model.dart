import 'package:vertical_factory/services/auth_service.dart';

class SigninViewModel {
  String _id = '';
  String _password = '';

  final AuthService _authService = AuthService();

  void setId(String value) => _id = value;
  void setPassword(String value) => _password = value;

  Future<AuthInfo> login() async {
    return await _authService.login(username: _id, password: _password);
  }
}
