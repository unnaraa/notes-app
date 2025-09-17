// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:notes_app/data/models/response/avatar_response_model.dart';

class AuthResponseModel {
    final User? user;
    final String? token;

    AuthResponseModel({
        this.user,
        this.token,
    });

    factory AuthResponseModel.fromJson(String str) => AuthResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AuthResponseModel.fromMap(Map<String, dynamic> json) => AuthResponseModel(
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toMap() => {
        "user": user?.toMap(),
        "token": token,
    };
}

class User {
    final int? id;
    final String? name;
    final String? username;
    final String? phone;
    final String? email;
    final String? image;
    final int? avatarId;
    final Avatar? avatar;
    final dynamic emailVerifiedAt;
    final dynamic createdAt;
    final dynamic updatedAt;

    User({
        this.id,
        this.name,
        this.username,
        this.phone,
        this.email,
        this.image,
        this.avatarId,
        this.avatar,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
    });

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        phone: json["phone"],
        email: json["email"],
        image: json["image"],
        avatarId: json["avatar_id"],
        avatar: json["avatar"] == null ? null : Avatar.fromMap(json["avatar"]),
        emailVerifiedAt: json["email_verified_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "username": username,
        "phone": phone,
        "email": email,
        "image": image,
        "avatar_id": avatarId,
        "avatar": avatar?.toMap(),
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };

  User copyWith({
    int? id,
    String? name,
    String? username,
    String? phone,
    String? email,
    String? image,
    int? avatarId,
    Avatar? avatar,
    dynamic emailVerifiedAt,
    dynamic createdAt,
    dynamic updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      image: image ?? this.image,
      avatarId: avatarId ?? this.avatarId,
      avatar: avatar ?? this.avatar,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}