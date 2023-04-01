import 'package:invite_for_a_break/src/bloc/form_submision_status.dart';
import 'package:invite_for_a_break/src/repository/auth_repo.dart';

import 'register_event.dart';
import 'register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepo authRepo;

  RegisterBloc({required this.authRepo}) : super(RegisterState()) {
    on<RegisterEvent>(_onEvent);
  }

  Future<void> _onEvent(
      RegisterEvent event, Emitter<RegisterState> emit) async {
    if (event is RegisterEmailChanged) {
      emit(state.copyWith(email: event.email));
    }
    // password update
    else if (event is RegisterPasswordChanged) {
      emit(state.copyWith(password: event.password));
    } else if (event is RegisterPasswordVerificationChanged) {
      emit(state.copyWith(passwordVerification: event.password));
    }
    // password visibility update
    else if (event is RegisterPasswordVisibilityChanged) {
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
    }
    //form submitted
    else if (event is RegisterSubmitted) {
      emit(state.copyWith(formStatus: FormSubmittingStatus()));

      try {
        final response = await authRepo.register(state.email, state.password);
        emit(state.copyWith(formStatus: SubmissionSuccessStatus()));
      } catch (e) {
        emit(state.copyWith(
            formStatus: SubmissionFailedStatus(
                e.toString().replaceAll("Exception: ", ""))));
      }
    }
  }
}
