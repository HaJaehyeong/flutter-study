class AuthResponse {
  final String enterprise;
  final int enterpriseId;
  final String name;
  final bool success;
  final String token;
  final String msg;

  AuthResponse({
    required this.enterprise,
    required this.enterpriseId,
    required this.name,
    required this.success,
    required this.token,
    required this.msg,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      enterprise: json['enterprise'],
      enterpriseId: json['enterprise_id'],
      name: json['name'],
      success: json['success'],
      token: json['token'],
      msg: json['msg'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'enterprise': enterprise,
      'enterprise_id': enterpriseId,
      'name': name,
      'success': success,
      'token': token,
      'msg': msg,
    };
  }
}
