abstract class RegisterEvent {}

class RegisterEmailChanged extends RegisterEvent {
  final String email;

  RegisterEmailChanged({required this.email});
}

class RegisterPasswordChanged extends RegisterEvent {
  final String password;

  RegisterPasswordChanged({required this.password});
}

class RegisterPasswordVerificationChanged extends RegisterEvent {
  final String password;

  RegisterPasswordVerificationChanged({required this.password});
}

class RegisterPasswordVisibilityChanged extends RegisterEvent {
  final bool isPasswordVisible;

  RegisterPasswordVisibilityChanged({required this.isPasswordVisible});
}

class RegisterSubmitted extends RegisterEvent {}
