class RegisterModel {
  final String accessToken;
  final String refreshToken;

  RegisterModel({required this.accessToken, required this.refreshToken});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );
  }
}
