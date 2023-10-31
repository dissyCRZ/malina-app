import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:malina_mobile_app/features/yandex_map/data/models/app_lat_long.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/other.dart';
import '../../../../shared/constants/border_radius.dart';

class SimpleYandexMap extends StatelessWidget {
  final AppLatLong location;
  SimpleYandexMap({
    Key? key,
    required this.location,
  }) : super(key: key);

  final mapControllerCompleter = Completer<YandexMapController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: borderR12,
        boxShadow: [
          smallShadow,
        ],
      ),
      child: ClipRRect(
        borderRadius: borderR12,
        child: Column(
          children: [
            SizedBox(
              height: 200.w,
              width: 350.w,
              child: YandexMap(
                onMapCreated: (YandexMapController yandexMapController) async {
                  mapControllerCompleter.complete(yandexMapController);
                  _moveToLocation(
                    location,
                  );
                },
                mapObjects: [
                  PlacemarkMapObject(
                    mapId: MapObjectId(
                      UniqueKey().toString(),
                    ),
                    point: Point(
                      latitude: location.lat,
                      longitude: location.long,
                    ),
                    icon: PlacemarkIcon.single(
                      PlacemarkIconStyle(
                        scale: 2.5,
                        image: BitmapDescriptor.fromAssetImage(
                          'assets/icons/location.png',
                        ),
                      ),
                    ),
                  ),
                ],
                zoomGesturesEnabled: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _moveToLocation(
    AppLatLong appLatLong,
  ) async {
    (await mapControllerCompleter.future).moveCamera(
      animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: appLatLong.lat,
            longitude: appLatLong.long,
          ),
          zoom: 12,
        ),
      ),
    );
  }
}
