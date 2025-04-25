class AuthRequest {
  final String username;
  final String password;

  AuthRequest({required this.username, required this.password});

  factory AuthRequest.fromJson(Map<String, dynamic> json) {
    return AuthRequest(username: json['username'], password: json['password']);
  }

  Map<String, dynamic> toJson() {
    return {'username': username, 'enterprise_id': password};
  }
}
