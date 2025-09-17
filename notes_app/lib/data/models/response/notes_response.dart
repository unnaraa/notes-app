import 'dart:convert';

class NotesResponseModel {
    final String? status;
    final String? message;
    final List<Notes>? data;

    NotesResponseModel({
        this.status,
        this.message,
        this.data,
    });

    factory NotesResponseModel.fromJson(String str) => NotesResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory NotesResponseModel.fromMap(Map<String, dynamic> json) => NotesResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Notes>.from(json["data"]!.map((x) => Notes.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
    };
}

class Notes {
    final int? id;
    final int? userId;
    final String? title;
    final String? deskripsi;
    final String? image;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Notes({
        this.id,
        this.userId,
        this.title,
        this.deskripsi,
        this.image,
        this.createdAt,
        this.updatedAt,
    });

    factory Notes.fromJson(String str) => Notes.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Notes.fromMap(Map<String, dynamic> json) => Notes(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        deskripsi: json["deskripsi"],
        image: json["image"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "deskripsi": deskripsi,
        "image": image,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
