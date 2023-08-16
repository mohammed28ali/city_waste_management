import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String userId, email, name;

  UserModel({
    required this.userId,
    required this.email,
    required this.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["userId"],
        name: json["name"],
        email: json["email"],
      );

  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
    };
  }

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      email: snapshot['email'],
      userId: snapshot['userId'],
      name: snapshot['name'],
    );
  }
}
