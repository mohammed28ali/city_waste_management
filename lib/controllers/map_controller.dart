import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  var markers = HashSet<Marker>().cast().obs;

  CollectionReference directions =
      FirebaseFirestore.instance.collection('directions');

  var lat1fire = 0.0.obs;
  var long1fire = 0.0.obs;
  var lat2fire = 0.0.obs;
  var long2fire = 0.0.obs;

  double get lat1fireNewValue {
    return lat1fire.value;
  }

  double get long1fireNewValue {
    return long1fire.value;
  }

  double get lat2fireNewValue {
    return lat2fire.value;
  }

  double get long2fireNewValue {
    return long2fire.value;
  }

  @override
  void onReady() {
    super.onReady();
    getDirectionsMarker1();
    getDirectionsMarker2();
  }

  @override
  void onInit() {
    super.onInit();
    getDirectionsMarker1();
    getDirectionsMarker2();
  }

  addNewMarkers(String id, title, snippet, var lat, var long) {
    markers.add(
      Marker(
        markerId: MarkerId(id),
        position: LatLng(lat, long),
        infoWindow: InfoWindow(
          title: title,
          snippet: snippet,
        ),
        draggable: true,
        onDragEnd: ((newPosition) {
          if (id == "1") {
            updateDirectionsMarker1(
                newPosition.latitude, newPosition.longitude);
          } else {
            updateDirectionsMarker2(
                newPosition.latitude, newPosition.longitude);
          }
          update();
        }),
      ),
    );
  }

  updateDirectionsMarker1(var latNewValue, var longNewValue) {
    directions
        .doc('marker 1')
        .update({
          'lat': latNewValue,
          'long': longNewValue,
        })
        .then((value) => print('added successfully'))
        .catchError((error) => print(error));
    update();
  }

  updateDirectionsMarker2(var latNewValue, var longNewValue) {
    directions
        .doc('marker 2')
        .update({
          'lat': latNewValue,
          'long': longNewValue,
        })
        .then((value) => print('added successfully'))
        .catchError((error) => print(error));
    update();
  }

  Future<void> getDirectionsMarker1() async {
    await directions.doc('marker 1').get().then((DocumentSnapshot snapshot) {
      snapshot.data();
      lat1fire.value = snapshot['lat']!;
      long1fire.value = snapshot['long']!;
      update();
    });
  }

  Future<void> getDirectionsMarker2() async {
    await directions.doc('marker 2').get().then((DocumentSnapshot snapshot) {
      snapshot.data();
      lat2fire.value = snapshot['lat']!;
      long2fire.value = snapshot['long']!;
      update();
    });
  }
}
