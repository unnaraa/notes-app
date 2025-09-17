import 'dart:convert';

class RegisterRequestModel {
    final String? email;
    final String? name;
    final String? username;
    final String? phone;
    final String? password;

    RegisterRequestModel({
        this.email,
        this.name,
        this.username,
        this.phone,
        this.password,
    });

    factory RegisterRequestModel.fromJson(String str) => RegisterRequestModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RegisterRequestModel.fromMap(Map<String, dynamic> json) => RegisterRequestModel(
        email: json["email"],
        name: json["name"],
        username: json["username"],
        phone: json["phone"],
        password: json["password"],
    );

    Map<String, dynamic> toMap() => {
        "email": email,
        "name": name,
        "username": username,
        "phone": phone,
        "password": password,
    };
}
