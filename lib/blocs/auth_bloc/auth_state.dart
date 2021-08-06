part of 'auth_bloc.dart';

@immutable
abstract class AuthState {
  final isAuthValid;

  AuthState(this.isAuthValid);
}

class AuthInitial extends AuthState {
  AuthInitial(isAuthValid) : super(isAuthValid);
}

class AuthSuccess extends AuthState {
  AuthSuccess(isAuthValid) : super(isAuthValid);
}

class AuthError extends AuthState {
  final String error;
  AuthError(isAuthValid, this.error) : super(isAuthValid);
}
