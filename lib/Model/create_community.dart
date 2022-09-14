// To parse this JSON data, do
//
//     final createCommunity = createCommunityFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CreateCommunity createCommunityFromJson(String str) => CreateCommunity.fromJson(json.decode(str));

String createCommunityToJson(CreateCommunity data) => json.encode(data.toJson());

class CreateCommunity {
    CreateCommunity({
        required this.description,
        required this.name,
        required this.topic,
    });

    final String description;
    final String name;
    final String topic;

    factory CreateCommunity.fromJson(Map<String, dynamic> json) => CreateCommunity(
        description: json["Description"],
        name: json["Name"],
        topic: json["Topic"],
    );

    Map<String, dynamic> toJson() => {
        "Description": description,
        "Name": name,
        "Topic": topic,
    };
}
