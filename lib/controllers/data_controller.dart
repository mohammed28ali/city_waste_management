import 'dart:collection';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DataController extends GetxController {
  var bin1 = "".obs;
  var bin2 = "".obs;
  var marker1 = HashSet<Marker>().cast().obs;
  var marker2 = HashSet<Marker>().cast().obs;

  double get bind1DoubleValue {
    return double.parse(bin1.value);
  }

  double get bind2DoubleValue {
    return double.parse(bin2.value);
  }

  @override
  void onInit() {
    super.onInit();
    getDateFromBin1();
    getDateFromBin2();
  }

  void getDateFromBin1() {
    DatabaseReference reference =
        FirebaseDatabase.instance.reference().child('bins');
    reference.child('bin1').onValue.listen((event) {
      if (event.snapshot.value != null) {
        String date = event.snapshot.value.toString();
        bin1.value = date;
      }
    });
  }

  void getDateFromBin2() {
    DatabaseReference reference =
        FirebaseDatabase.instance.reference().child('bins');
    reference.child('bin2').onValue.listen((event) {
      if (event.snapshot.value != null) {
        String date = event.snapshot.value.toString();
        bin2.value = date;
      }
    });
  }

  addNewMarker1(String id, title, snippet, var lat, var long) {
    marker1.add(
      Marker(
        markerId: MarkerId(id),
        position: LatLng(lat, long),
        infoWindow: InfoWindow(
          title: title,
          snippet: snippet,
        ),
        draggable: false,
      ),
    );
  }

  addNewMarker2(String id, title, snippet, var lat, var long) {
    marker2.add(
      Marker(
        markerId: MarkerId(id),
        position: LatLng(lat, long),
        infoWindow: InfoWindow(
          title: title,
          snippet: snippet,
        ),
        draggable: false,
      ),
    );
  }
}
