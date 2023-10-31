import 'package:flutter_bloc/flutter_bloc.dart';

class SearchContCubit extends Cubit<String> {
  SearchContCubit() : super('');
  change(String query) {
    emit(query);
  }
}
