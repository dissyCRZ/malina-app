part of 'selected_service_cubit.dart';

abstract class SelectedServiceState extends Equatable {
  const SelectedServiceState();

  @override
  List<Object> get props => [];
}

class NotSelected extends SelectedServiceState {}

class Selected extends SelectedServiceState {
  final List<ServiceModel> services;
  const Selected({
    required this.services,
  });
  @override
  List<Object> get props => [services];
}
