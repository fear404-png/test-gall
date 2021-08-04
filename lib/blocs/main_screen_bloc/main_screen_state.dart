part of 'main_screen_bloc.dart';

@immutable
abstract class MainScreenState {
  final int index;
  final Widget curretWidget;

  const MainScreenState(this.curretWidget, this.index);
}

class MainScreenInitial extends MainScreenState {
  MainScreenInitial(Widget curretWidget, int index)
      : super(curretWidget, index);
}
