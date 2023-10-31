part of 'selected_specialist_cubit.dart';

abstract class SelectedSpecialistState extends Equatable {
  const SelectedSpecialistState();

  @override
  List<Object> get props => [];
}

class NotSelected extends SelectedSpecialistState {}

class Selected extends SelectedSpecialistState {
  final SpecialistModel specialist;
  const Selected({
    required this.specialist,
  });
  @override
  List<Object> get props => [specialist];
}
