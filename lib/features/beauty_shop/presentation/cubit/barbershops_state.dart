part of 'barbershops_cubit.dart';

class BarbershopsState extends Equatable {
  final List<BusinessModel> barbershops;
  const BarbershopsState(
    this.barbershops,
  );

  @override
  List<Object> get props => [
        barbershops,
      ];
}
