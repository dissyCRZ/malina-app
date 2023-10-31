import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/yandex_map/data/models/search_result.dart';

part 'yandex_search_state.dart';

class YandexSearchCubit extends Cubit<YandexSearchState> {
  YandexSearchCubit() : super(YandexSearchNotAssigned());
  search(List<SearchResultModel> locations) {
    if (locations.isEmpty) {
      emit(
        YandexSearchNotAssigned(),
      );
    } else {
      emit(
        YandexSearchAssigned(
          locations: locations,
        ),
      );
    }
  }

  empty() {
    emit(
      YandexSearchNotAssigned(),
    );
  }
}
