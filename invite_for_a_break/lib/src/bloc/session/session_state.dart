abstract class SessionState {}

class UnknowSessionState extends SessionState {}

class UnauthenticatedSessionState extends SessionState {}

class AuthenticatedSessionState extends SessionState {
  final String token;

  AuthenticatedSessionState({required this.token});
}
