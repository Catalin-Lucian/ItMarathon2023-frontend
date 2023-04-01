import 'package:invite_for_a_break/src/bloc/form_submision_status.dart';

class RegisterState {
  // ------------ Email ------------
  final String email;
  bool get isValidEmail =>
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);

  // ------------ Password ------------
  final String password;
  final String passwordVerification;
  bool get isValidPassword => password.length >= 6;
  bool get isPasswordMatching => password == passwordVerification;
  final bool isPasswordVisible;

  // ------------ Form ------------
  final FormSubmissionStatus formStatus;

  RegisterState({
    this.email = '',
    this.password = '',
    this.passwordVerification = '',
    this.isPasswordVisible = false,
    this.formStatus = const InitialFormStatus(),
  });

  RegisterState copyWith({
    String? email,
    String? password,
    String? passwordVerification,
    bool? isPasswordVisible,
    FormSubmissionStatus? formStatus,
  }) {
    return RegisterState(
      email: email ?? this.email,
      password: password ?? this.password,
      passwordVerification: passwordVerification ?? this.passwordVerification,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
