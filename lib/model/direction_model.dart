import 'package:cloud_firestore/cloud_firestore.dart';

class DirectionsModel {
  var lat1;
  var lat2;
  var long1;
  var long2;

  DirectionsModel({
    required this.lat1,
    required this.lat2,
    required this.long1,
    required this.long2,
  });

  factory DirectionsModel.fromJson(Map<String, dynamic> json) =>
      DirectionsModel(
        lat1: json["lat"],
        lat2: json["lat"],
        long1: json["long"],
        long2: json["long"],
      );

  DirectionsModel.fromMap(DocumentSnapshot date) {
    lat1 = date["lat"];
    lat2 = date["lat"];
    long1 = date["long"];
    long2 = date["long"];
  }
}
