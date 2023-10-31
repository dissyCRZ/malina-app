import 'package:malina_mobile_app/features/yandex_map/data/models/app_lat_long.dart';

class SearchResultModel {
  final String name;
  final AppLatLong location;
  SearchResultModel({
    required this.name,
    required this.location,
  });
}
