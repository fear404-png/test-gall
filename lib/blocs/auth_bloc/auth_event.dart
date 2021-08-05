part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignUp extends AuthEvent {
  final String userName;
  String birthday;
  final String email;
  final String password;

  SignUp(
      {required this.userName,
      this.birthday = "2021-08-05T11:02:28.191Z",
      required this.password,
      required this.email});
}
