import 'package:flutter_bloc/flutter_bloc.dart';

class OrderExpansionContCubit extends Cubit<bool> {
  OrderExpansionContCubit() : super(false);
  change() {
    emit(!super.state);
  }
}
