import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'popup_message_state.dart';

class PopupMessageCubit extends Cubit<PopupMessageState> {
  PopupMessageCubit() : super(PopupMessageInvisible());
  popup(
    String message, {
    int seconds = 3,
  }) async {
    emit(
      PopupMessageVisible(
        message: message,
      ),
    );
    await Future.delayed(
      Duration(
        seconds: seconds,
      ),
    );
    emit(
      PopupMessageInvisible(),
    );
  }
}
