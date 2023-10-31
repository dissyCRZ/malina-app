import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_order_sheet_state.dart';

class CartOrderSheetCubit extends Cubit<CartOrderSheetState> {
  CartOrderSheetCubit() : super(CartOrderSheetInitial());
}
