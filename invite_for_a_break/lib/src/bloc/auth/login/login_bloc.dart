import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invite_for_a_break/src/bloc/auth/auth_cubit.dart';
import 'package:invite_for_a_break/src/bloc/form_submision_status.dart';
import 'package:invite_for_a_break/src/repository/auth_repo.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepo authRepo;
  final AuthCubit authCubit;

  LoginBloc({required this.authRepo, required this.authCubit})
      : super(LoginState()) {
    on<LoginEvent>(_onEvent);
  }

  Future<void> _onEvent(LoginEvent event, Emitter<LoginState> emit) async {
    if (event is LoginEmailChanged) {
      emit(state.copyWith(email: event.email));
    }
    // password update
    else if (event is LoginPasswordChanged) {
      emit(state.copyWith(password: event.password));
    }
    // password visibility update
    else if (event is LoginPasswordVisibilityChanged) {
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
    }
    //form submitted
    else if (event is LoginSubmitted) {
      emit(state.copyWith(formStatus: FormSubmittingStatus()));

      try {
        final token = await authRepo.login(state.email, state.password);
        emit(state.copyWith(formStatus: SubmissionSuccessStatus()));
        authCubit.launchSession(token);
      } catch (e) {
        emit(state.copyWith(
            formStatus: SubmissionFailedStatus(
                e.toString().replaceAll("Exception: ", ""))));
      }
    }
  }
}
