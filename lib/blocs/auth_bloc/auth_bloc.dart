import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:http_auth/http_auth.dart';
import 'package:meta/meta.dart';
import 'package:test_gall/blocs/auth_bloc/model/auth_user.dart';
import 'package:test_gall/blocs/auth_bloc/model/responce_erorr.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  String _userName = "";
  String _email = "";
  String _birthday = "2021-08-05T11:02:28.191Z";
  String _password = "";
  String _confirmPassword = "";
  static bool _isValidAuth = false;
  AuthBloc() : super(AuthInitial(_isValidAuth));

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
      if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(_email) &&
          _password == _confirmPassword &&
          _password.length >= 5) {
        final _user = ItemsAuthUser(
                email: _email,
                password: _password,
                username: _userName,
                birthday: _birthday)
            .toJson();

        final _response = await post(
            Uri.parse("http://gallery.dev.webant.ru/api/users"),
            body: json.encode(_user),
            headers: {"content-type": "application/json"}).catchError((e) {
          print(e);
        });
        print(_response.body);
        if (_response.body.split(':')[0] == "{\"type\"") {
          print(responceErrorFromJson(_response.body).detail);
          yield AuthError(
              _isValidAuth, responceErrorFromJson(_response.body).detail);
        } else {
          _isValidAuth = true;
          yield AuthSuccess(_isValidAuth);
        }
      } else {
        _isValidAuth = false;

        if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(_email)) {
          yield AuthError(_isValidAuth, "Неверный email");
        } else if (_password != _confirmPassword) {
          yield AuthError(_isValidAuth, "Пароли не совпадают");
        } else if (_password.length <= 5) {
          yield AuthError(
              _isValidAuth, "Пароль должен содержать больше 5 символов");
        } else {
          yield AuthError(
              _isValidAuth, "Пожалуйста, проверьте валидность данных");
        }
      }
    }
  }
}
