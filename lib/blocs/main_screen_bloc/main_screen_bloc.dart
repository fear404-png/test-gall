import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:meta/meta.dart';

import 'package:test_gall/pages/add_data_page.dart';
import 'package:test_gall/pages/home_page.dart';
import 'package:test_gall/pages/profile_page.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  static final List<Widget> _listItem = [
    const HomePage(),
    const AddDataPage(),
    const ProfilePage()
  ];
  static int _index = 0;

  MainScreenBloc() : super(MainScreenInitial(_listItem[_index], _index));

  @override
  Stream<MainScreenState> mapEventToState(
    MainScreenEvent event,
  ) async* {
    if (event is SetPage) {
      _index = event.indexPage;

      yield MainScreenInitial(_listItem[_index], _index);
    }
  }
}
