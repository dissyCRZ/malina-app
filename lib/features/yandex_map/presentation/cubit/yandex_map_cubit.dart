import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/yandex_map/data/models/app_lat_long.dart';

part 'yandex_map_state.dart';

class YandexMapCubit extends Cubit<YandexMapState> {
  YandexMapCubit() : super(YandexMapNotAssigned());
  select(AppLatLong location) {
    emit(
      YandexMapAssigned(
        location: location,
      ),
    );
  }
}
