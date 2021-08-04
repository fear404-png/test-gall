part of 'main_screen_bloc.dart';

@immutable
abstract class MainScreenState {
  final int index;
  final Widget curretWidget;

  const MainScreenState(this.curretWidget, this.index);
}

class MainScreenInitial extends MainScreenState {
  const MainScreenInitial(Widget curretWidget, index)
      : super(curretWidget, index);
}
