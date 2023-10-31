import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_mobile_app/features/yandex_map/data/repositories/geocoding_service.dart';
import 'package:malina_mobile_app/features/address/presentation/cubit/selected_address_cubit.dart';
import 'package:malina_mobile_app/features/yandex_map/data/models/search_result.dart';
import 'package:malina_mobile_app/features/yandex_map/presentation/cubit/yandex_map_cubit.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/constants/other.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import '../../../../shared/constants/border_radius.dart';
import '../../data/models/app_lat_long.dart';
import '../../data/repositories/location_service.dart';

class YandexMapContainer extends StatefulWidget {
  const YandexMapContainer({super.key});

  @override
  State<YandexMapContainer> createState() => _YandexMapContainerState();
}

class _YandexMapContainerState extends State<YandexMapContainer> {
  final mapControllerCompleter = Completer<YandexMapController>();
  List<MapObject> mapObjects = [];

  @override
  void initState() {
    super.initState();
    _initPermission().ignore();
  }

  addMarker(AppLatLong location) {
    mapObjects.add(
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
    );
  }

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
              child: BlocConsumer<YandexMapCubit, YandexMapState>(
                listener: (context, moveState) {
                  if (moveState is YandexMapAssigned) {
                    _moveToLocation(
                      moveState.location,
                    );
                    addMarker(moveState.location);
                  }
                },
                builder: (context, state) => YandexMap(
                  onMapCreated:
                      (YandexMapController yandexMapController) async {
                    mapControllerCompleter.complete(yandexMapController);
                  },
                  onMapTap: (argument) async {
                    try {
                      final addressString =
                          await GeocodingService.getGeocodingString(
                        argument.latitude,
                        argument.longitude,
                      );
                      if (mounted) {
                        context.read<SelectedAddressCubit>().select(
                              SearchResultModel(
                                name: addressString,
                                location: AppLatLong(
                                  lat: argument.latitude,
                                  long: argument.longitude,
                                ),
                              ),
                            );

                        context.read<YandexMapCubit>().select(
                              AppLatLong(
                                lat: argument.latitude,
                                long: argument.longitude,
                              ),
                            );
                      }
                    } catch (e) {
                      log('Failed to geolocate $e');
                    }
                  },
                  mapObjects: mapObjects,
                  zoomGesturesEnabled: true,
                ),
              ),
            ),
            BlocBuilder<SelectedAddressCubit, SelectedAddressState>(
              builder: (context, state) {
                if (state is Selected) {
                  return Container(
                    height: 65.h,
                    padding: marginH,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      state.location.name,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> _initPermission() async {
    if (!await LocationService().checkPermission()) {
      await LocationService().requestPermission();
    }
    await _fetchCurrentLocation();
  }

  Future<void> _fetchCurrentLocation() async {
    AppLatLong location;
    const defLocation = MoscowLocation();
    try {
      location = await LocationService().getCurrentLocation();
    } catch (e) {
      log('Error: $e');
      location = defLocation;
    }
    _moveToLocation(location);
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
