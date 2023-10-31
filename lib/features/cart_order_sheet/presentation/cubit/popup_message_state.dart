part of 'popup_message_cubit.dart';

abstract class PopupMessageState extends Equatable {
  const PopupMessageState();

  @override
  List<Object> get props => [];
}

class PopupMessageInvisible extends PopupMessageState {}

class PopupMessageVisible extends PopupMessageState {
  final String message;
  const PopupMessageVisible({
    required this.message,
  });
  
  @override
  List<Object> get props => [message];
}
