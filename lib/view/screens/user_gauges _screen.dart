import 'package:at_gauges/at_gauges.dart';
import 'package:city_waste_management/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../controllers/data_controller.dart';
import '../../controllers/map_controller.dart';

class UserGaugesScreen extends StatelessWidget {
  UserGaugesScreen({Key? key}) : super(key: key);

  final controller = Get.put(DataController());
  final mapController = Get.put(MapController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.defaultDialog(
                  content: SizedBox(
                    height: 550,
                    width: double.infinity,
                    child: Obx(() => GoogleMap(
                          mapType: MapType.hybrid,
                          initialCameraPosition: CameraPosition(
                            target: LatLng(mapController.lat1fire.value,
                                mapController.long1fire.value),
                            zoom: 14,
                          ),
                          onMapCreated:
                              (GoogleMapController googleMapController) {
                            controller.addNewMarker1(
                              "3",
                              "Basket 1",
                              "Please take out the trash waste",
                              mapController.lat1fire.value,
                              mapController.long1fire.value,
                            );
                          },
                          markers: controller.marker1.value.cast(),
                        )),
                  ),
                  textCancel: 'Cancel',
                  cancelTextColor: Colors.white,
                  backgroundColor: primaryColor);
            },
            child: Obx(() => ScaleRadialGauge(
                  maxValue: 100,
                  actualValue: controller.bind1DoubleValue,
                  // Optional Parameters
                  minValue: 0,
                  size: 300,
                  title: const Text(''),
                  titlePosition: TitlePosition.top,
                  pointerColor: primaryColor,
                  needleColor: Colors.deepPurple,
                  decimalPlaces: 0,
                  isAnimate: true,
                  animationDuration: 2000,
                  unit: const TextSpan(
                      text: ' - basket 1', style: TextStyle(fontSize: 15)),
                )),
          ),
          GestureDetector(
            onTap: () {
              Get.defaultDialog(
                content: SizedBox(
                  height: 550,
                  width: double.infinity,
                  child: Obx(() => GoogleMap(
                        mapType: MapType.hybrid,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(mapController.lat2fire.value,
                              mapController.long2fire.value),
                          zoom: 14,
                        ),
                        onMapCreated:
                            (GoogleMapController googleMapController) {
                          controller.addNewMarker2(
                            "4",
                            "Basket 2",
                            "Please take out the trash waste",
                            mapController.lat2fire.value,
                            mapController.long2fire.value,
                          );
                        },
                        markers: controller.marker2.value.cast(),
                      )),
                ),
                textCancel: 'Cancel',
                cancelTextColor: Colors.white,
                backgroundColor: primaryColor,
              );
            },
            child: Obx(
              () => ScaleRadialGauge(
                maxValue: 100,
                actualValue: controller.bind2DoubleValue,
                // Optional Parameters
                minValue: 0,
                size: 300,
                title: const Text(''),
                titlePosition: TitlePosition.top,
                pointerColor: primaryColor,
                needleColor: Colors.deepPurple,
                decimalPlaces: 0,
                isAnimate: true,
                animationDuration: 2000,
                unit: const TextSpan(
                    text: ' - basket 2', style: TextStyle(fontSize: 15)),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
