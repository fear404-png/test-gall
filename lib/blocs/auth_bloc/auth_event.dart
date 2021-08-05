part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignUp extends AuthEvent {}

class ValidateInputUserName extends AuthEvent {
  final String input;

  ValidateInputUserName(this.input);
}

class ValidateInputBirthday extends AuthEvent {
  final String input;

  ValidateInputBirthday(this.input);
}

class ValidateInputPassword extends AuthEvent {
  final String input;

  ValidateInputPassword(this.input);
}

class ValidateInputConfirmPassword extends AuthEvent {
  final String input;

  ValidateInputConfirmPassword(this.input);
}

class ValidateInputEmail extends AuthEvent {
  final String input;

  ValidateInputEmail(this.input);
}
