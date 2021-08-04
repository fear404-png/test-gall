part of 'main_screen_bloc.dart';

@immutable
abstract class MainScreenState {
  final index;
  final Widget curretWidget;

  MainScreenState(this.curretWidget, this.index);
}

class MainScreenInitial extends MainScreenState {
  MainScreenInitial(Widget curretWidget, index) : super(curretWidget, index);
}
