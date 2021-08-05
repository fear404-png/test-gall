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
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is SignUp) {
      print("goo");
      final _user = ItemsAuthUser(
              email: event.email,
              password: event.password,
              username: event.userName,
              birthday: event.birthday)
          .toJson();
      final _response = await post(
          Uri.parse("http://gallery.dev.webant.ru/api/users"),
          body: json.encode( _user)

          // {
          //     "email": event.email,
          //     "password": event.password,
          //     "username": event.userName
          //   }

          );
      print(_response.body);
    }
  }
}
