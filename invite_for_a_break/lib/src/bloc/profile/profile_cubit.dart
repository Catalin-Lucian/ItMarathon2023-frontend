import 'package:flutter_bloc/flutter_bloc.dart';

enum ProfileNavState { main, setFreeTime, viewFreeTime }

class ProfileCubit extends Cubit<ProfileNavState> {
  ProfileCubit() : super(ProfileNavState.main);

  void gotoMain() => emit(ProfileNavState.main);
  void gotoSetFreeTime() => emit(ProfileNavState.setFreeTime);
  void gotoViewFreeTime() => emit(ProfileNavState.viewFreeTime);
}
