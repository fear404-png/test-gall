import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:http_auth/http_auth.dart';
import 'package:meta/meta.dart';
import 'package:test_gall/blocs/auth_bloc/model/auth_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  String _userName = "";
  String _email = "";
  String _birthday = "2021-08-05T11:02:28.191Z";
  String _password = "";
  String _confirmPassword = "";
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is ValidateInputUserName) {
      _userName = event.input;
    } else if (event is ValidateInputBirthday) {
      _birthday = event.input;
    } else if (event is ValidateInputPassword) {
      _password = event.input;
    } else if (event is ValidateInputConfirmPassword) {
      _confirmPassword = event.input;
    } else if (event is ValidateInputEmail) {
      _email = event.input;
    } else if (event is SignUp) {
      final _user = ItemsAuthUser(
              email: _email,
              password: _password,
              username: _userName,
              birthday: _birthday)
          .toJson();
      print(_user);

      final _response = await post(
          Uri.parse("http://gallery.dev.webant.ru/api/users"),
          body: json.encode(_user),
          headers: {"content-type": "application/json"});
      print(_response.body);
    }
  }
}
