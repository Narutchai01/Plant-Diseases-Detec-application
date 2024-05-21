import 'dart:convert';

class GetToken {
  String token;
  int id;

  GetToken({required this.token, required this.id});

  factory GetToken.fromJson(Map<String, dynamic> json) {
    return GetToken(
      token: json['token'],
      id: json['id'],
    );
  }
}




