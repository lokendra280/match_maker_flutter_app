import 'dart:html';

import 'package:flutter/foundation.dart';

class UserModel {
  String? id, username, email;
  UserModel({this.id, this.email, this.username});
  factory UserModel.fromMap(map) {
    return UserModel(
        email: map['email'], username: map["username"], id: map.id);
  }
  Map<String, dynamic> toMap() {
    return {
      // "id": id,
      "email": email,
      "username": username,
    };
  }
}
