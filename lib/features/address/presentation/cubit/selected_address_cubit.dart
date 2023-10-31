import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/yandex_map/data/models/search_result.dart';

part 'selected_address_state.dart';

class SelectedAddressCubit extends Cubit<SelectedAddressState> {
  SelectedAddressCubit() : super(NotSelected());
  select(SearchResultModel location) {
    emit(
      Selected(
        location: location,
      ),
    );
  }

  empty() {
    emit(
      NotSelected(),
    );
  }
}
