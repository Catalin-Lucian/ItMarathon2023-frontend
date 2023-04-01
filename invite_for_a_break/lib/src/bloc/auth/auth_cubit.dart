import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invite_for_a_break/src/bloc/session/session_cubit.dart';

enum AuthState { login, signUp }

class AuthCubit extends Cubit<AuthState> {
  final SessionCubit sessionCubit;
  AuthCubit({required this.sessionCubit}) : super(AuthState.login);

  void showLogin() => emit(AuthState.login);
  void showSignUp() => emit(AuthState.signUp);

  void launchSession(String token) => sessionCubit.showSession(token);
}
