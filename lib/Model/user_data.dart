// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
    User({
        this.id,
        this.name,
        this.email,
        this.password,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.following,
        this.chatId,
        this.followers,
    });

    String? id;
    String? name;
    String? email;
    String? password;
    bool? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    List<Follow>? following;
    List<String>? chatId;
    List<Follow>? followers;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        following: List<Follow>.from(json["Following"].map((x) => Follow.fromJson(x))),
        chatId: List<String>.from(json["ChatId"].map((x) => x)),
        followers: List<Follow>.from(json["Followers"].map((x) => Follow.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "password": password,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "Following": List<dynamic>.from(following!.map((x) => x.toJson())),
        "ChatId": List<dynamic>.from(chatId!.map((x) => x)),
        "Followers": List<dynamic>.from(followers!.map((x) => x.toJson())),
    };
}

class Follow {
    Follow({
        this.userName,
        this.uid,
        this.id,
    });

    String? userName;
    String? uid;
    String? id;

    factory Follow.fromJson(Map<String, dynamic> json) => Follow(
        userName: json["UserName"],
        uid: json["uid"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "UserName": userName,
        "uid": uid,
        "_id": id,
    };
}
