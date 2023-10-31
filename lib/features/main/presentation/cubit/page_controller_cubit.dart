import 'package:flutter_bloc/flutter_bloc.dart';

class PageContCubit extends Cubit<int> {
  PageContCubit() : super(2);
  change(int index) {
    emit(index);
  }
}
