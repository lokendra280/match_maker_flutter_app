import 'package:flutter/cupertino.dart';

class Partnerslist with ChangeNotifier {
  final String name;
  final String gender;
  final String city;
  final double createdAt;
  final String diet;
   final String email;
  final String height;
  final String marriage;
  final double phoneNumber;
  final String profilePic;
  final String uid;

  Partnerslist({required this.name, required this.gender, required this.city, required this.createdAt, required this.diet,
   required this.email, required this.height, required this.marriage, required this.phoneNumber,
    required this.profilePic, required this.uid, 
  
  }
  );


}