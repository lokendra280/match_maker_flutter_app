class UserModel {
  String name;
  String email;
  String bio;
  String marriage;
  String city;
  String diet;
  String height;
  
  String profilePic;
  String createdAt;
  String phoneNumber;
  String uid;

  UserModel({
    required this.name,
    required this.email,
    required this.bio,
    required this.city,
    required this.diet,
    required this.height,
    required this.marriage,
    
    required this.profilePic,
    required this.createdAt,
    required this.phoneNumber,
    required this.uid,
  });

  // from map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      bio: map['bio'] ?? '',
      uid: map['uid'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      createdAt: map['createdAt'] ?? '',
      profilePic: map['profilePic'] ?? '',
       city: map['city'] ?? '',
       marriage: map['marriage'] ?? '',
       diet: map['diet'] ?? '',
       height: map['height'] ?? '',
    );
  }

  // to map
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "city" : city,
      "marriage" : marriage,
      "diet" : diet,
      "height" : height,
      "uid": uid,
      "bio": bio,
      "profilePic": profilePic,
      "phoneNumber": phoneNumber,
      "createdAt": createdAt,
    };
  }
}
