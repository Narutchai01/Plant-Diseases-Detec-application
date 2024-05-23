import 'dart:convert';

Account accountFromJson(String str) => Account.fromJson(json.decode(str));

String accountToJson(Account data) => json.encode(data.toJson());

class Account {
  int? id;
  String? name;
  String? email;
  DateTime? createdAt;

  Account({
    this.id,
    this.name,
    this.email,
    this.createdAt,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "created_at": createdAt?.toIso8601String(),
  };
}
