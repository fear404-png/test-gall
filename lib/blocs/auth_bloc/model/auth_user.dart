import 'dart:convert';

ItemsAuthUser itemsAuthUserFromJson(String str) =>
    ItemsAuthUser.fromJson(json.decode(str));

String itemsAuthUserToJson(ItemsAuthUser data) => json.encode(data.toJson());

class ItemsAuthUser {
  ItemsAuthUser({
    required this.email,
    required this.password,
    required this.username,
    required this.birthday,
  });

  String email;
  String password;
  String username;
  String birthday;

  factory ItemsAuthUser.fromJson(Map<String, dynamic> json) => ItemsAuthUser(
        email: json["email"],
        password: json["password"],
        username: json["username"],
        birthday: json["birthday"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "username": username,
        "birthday": birthday,
      };
}
