import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ad_carousel_state.dart';

class AdCarouselCubit extends Cubit<AdCarouselState> {
  AdCarouselCubit() : super(AdCarouselInitial());
}
