import 'dart:convert';


List<AllCommunity> allCommunitiesFromJson(String str) => List<AllCommunity>.from(json.decode(str).map((x) => AllCommunity.fromJson(x)));

String allCommunitiesToJson(List<AllCommunity> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllCommunity {
  String? sId;
  String? name;
  String? coverImage;
  String? createrId;
  List<Members>? members;
  int? iV;
  List<Messeges>? messeges;

  AllCommunity(
      {this.sId,
      this.name,
      this.coverImage,
      this.createrId,
      this.members,
      this.iV,
      this.messeges});

  AllCommunity.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['Name'];
    coverImage = json['CoverImage'];
    createrId = json['CreaterId'];
    if (json['Members'] != null) {
      members = <Members>[];
      json['Members'].forEach((v) {
        members!.add(new Members.fromJson(v));
      });
    }
    iV = json['__v'];
    if (json['Messeges'] != null) {
      messeges = <Messeges>[];
      json['Messeges'].forEach((v) {
        messeges!.add(new Messeges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = sId;
    data['Name'] = name;
    data['CoverImage'] = coverImage;
    data['CreaterId'] = createrId;
    if (members != null) {
      data['Members'] = members!.map((v) => v.toJson()).toList();
    }
    data['__v'] = iV;
    if (messeges != null) {
      data['Messeges'] = messeges!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Members {
  String? userName;
  String? userId;
  String? sId;

  Members({this.userName, this.userId, this.sId});

  Members.fromJson(Map<String, dynamic> json) {
    userName = json['UserName'];
    userId = json['UserId'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserName'] = userName;
    data['UserId'] = userId;
    data['_id'] = sId;
    return data;
  }
}

class Messeges {
  User? user;
  String? message;
  String? time;
  String? sId;

  Messeges({this.user, this.message, this.time, this.sId});

  Messeges.fromJson(Map<String, dynamic> json) {
    user = json['User'] != null ? new User.fromJson(json['User']) : null;
    message = json['Message'];
    time = json['Time'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (user != null) {
      data['User'] = user!.toJson();
    }
    data['Message'] = message;
    data['Time'] = time;
    data['_id'] = sId;
    return data;
  }
}

class User {
  String? name;
  String? uid;

  User({this.name, this.uid});

  User.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['Name'] = name;
    data['uid'] = uid;
    return data;
  }
}
