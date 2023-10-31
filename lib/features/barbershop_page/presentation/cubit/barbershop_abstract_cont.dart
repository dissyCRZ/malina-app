import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/beauty_shop/data/models/beauty_tag.dart';

abstract class BarbershopAbstractCubit extends Cubit<BeautyTagModel> {
  BarbershopAbstractCubit(BeautyTagModel initial)
      : super(
          initial,
        );
  change(BeautyTagModel tag) {
    emit(
      tag,
    );
  }
}
