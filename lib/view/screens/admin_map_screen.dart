import 'package:city_waste_management/constants.dart';
import 'package:city_waste_management/view/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../controllers/map_controller.dart';

class AdminMap extends StatelessWidget {
  AdminMap({Key? key}) : super(key: key);

  final controller = Get.put(MapController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: GetBuilder<MapController>(builder: (_){
            return AuthButton(
              text: 'Show Map',
              onPressed: ()
              {
                Get.defaultDialog(
                  content: SafeArea(
                    child: SizedBox(
                      height: 550,
                      width: double.infinity,
                      child: Obx(() => GoogleMap(
                        mapType: MapType.hybrid,
                        initialCameraPosition: const CameraPosition(
                          target: LatLng(30.01240764892444, 30.986904117845484),
                          zoom: 14,
                        ),
                        onMapCreated:
                            (GoogleMapController googleMapController) {
                          controller.addNewMarkers(
                            "1",
                            "Basket 1",
                            "Drag marker to change location",
                            controller.lat1fireNewValue,
                            controller.long1fireNewValue,
                          );
                          controller.addNewMarkers(
                            "2",
                            "Basket 2",
                            "Drag marker to change location",
                            controller.lat2fireNewValue,
                            controller.long2fireNewValue,
                          );
                        },
                        markers: controller.markers.value.cast(),
                      ),
                      ),
                    ),
                  ),
                  title: 'Update Location',
                  radius: 25,
                  backgroundColor: primaryColor,
                  buttonColor: Colors.green,
                  textCancel: "Update",
                  onCancel: (){
                     controller.getDirectionsMarker1();
                     controller.getDirectionsMarker2();
                  },
                  cancelTextColor: Colors.white,
                );
              },
            );
          },)
        ),
      ],
    );
  }
}
