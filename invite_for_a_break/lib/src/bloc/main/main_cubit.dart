import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(HomeState());

  void showHome() => emit(HomeState());
  void showSendRequest() => emit(SendRequestState());
  void showViewRerquests() => emit(ViewRequestState());
  void showProfile() => emit(ViewProfileState());

  void showByIndex(index) {
    switch (index) {
      case 0:
        showHome();
        break;
      case 1:
        showSendRequest();
        break;
      case 2:
        showViewRerquests();
        break;
      case 3:
        showProfile();
        break;
      default:
        showHome();
    }
  }
}
