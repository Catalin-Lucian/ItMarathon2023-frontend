import 'package:invite_for_a_break/src/bloc/form_submision_status.dart';

class LoginState {
  // ------------ Email ------------
  final String email;
  bool get isValidEmail =>
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);

  // ------------ Password ------------
  final String password;
  bool get isValidPassword => true;
  final bool isPasswordVisible;

  // ------------ Form ------------
  final FormSubmissionStatus formStatus;

  LoginState({
    this.email = '',
    this.password = '',
    this.isPasswordVisible = false,
    this.formStatus = const InitialFormStatus(),
  });

  LoginState copyWith({
    String? email,
    String? password,
    bool? isPasswordVisible,
    FormSubmissionStatus? formStatus,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
