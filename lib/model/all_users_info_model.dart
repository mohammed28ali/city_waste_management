import 'package:cloud_firestore/cloud_firestore.dart';

class UsersInfoModel {
  String? email;
  String? name;

  UsersInfoModel({
    required this.email,
    required this.name,
  });

  UsersInfoModel.fromMap(DocumentSnapshot data) {
    email = data['email'];
    name = data['name'];
  }
}
