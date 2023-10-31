import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_mobile_app/features/home/data/enums/app_type.dart';

class AppTypeCubit extends Cubit<AppType> {
  AppTypeCubit()
      : super(
          AppType.unregistered,
        );
  change(AppType type) {
    emit(type);
  }

  empty() {
    emit(AppType.unregistered);
  }
}
