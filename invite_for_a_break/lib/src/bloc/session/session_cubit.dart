import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invite_for_a_break/src/repository/auth_repo.dart';

import 'session_state.dart';

class SessionCubit extends Cubit<SessionState> {
  final AuthRepo authRepo;

  SessionCubit({required this.authRepo}) : super(UnknowSessionState()) {
    attemptAutoLogin();
  }

  void attemptAutoLogin() async {
    try {
      final token = await authRepo.attemptAutoLogin();
      emit(AuthenticatedSessionState(token: token));
    } catch (e) {
      emit(UnauthenticatedSessionState());
    }
  }

  void showAtuh() => emit(UnauthenticatedSessionState());
  void showSession(String token) =>
      emit(AuthenticatedSessionState(token: token));

  void signOut() {
    authRepo.signOut();
    emit(UnauthenticatedSessionState());
  }
}
