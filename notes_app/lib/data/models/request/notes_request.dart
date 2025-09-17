import 'dart:convert';

class NotesRequestModel {
    final String? title;
    final String? deskripsi;
    final int? userId;
    final String? image;

    NotesRequestModel({
        this.title,
        this.deskripsi,
        this.userId,
        this.image,
    });

    factory NotesRequestModel.fromJson(String str) => NotesRequestModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory NotesRequestModel.fromMap(Map<String, dynamic> json) => NotesRequestModel(
        title: json["title"],
        deskripsi: json["deskripsi"],
        userId: json["image"],
        image: json["user_id"],
    );

    Map<String, dynamic> toMap() => {
        "title": title,
        "deskripsi": deskripsi,
        "image": image,
        "user_id": userId,
    };
}
