import 'package:flutter_bloc/flutter_bloc.dart';

class CartButtonContCubit extends Cubit<bool> {
  CartButtonContCubit() : super(false);
  change() {
    emit(!super.state);
  }
}
