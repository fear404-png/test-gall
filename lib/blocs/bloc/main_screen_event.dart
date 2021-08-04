part of 'main_screen_bloc.dart';

@immutable
abstract class MainScreenEvent {}

class SetPage extends MainScreenEvent {
  final int indexPage;

  SetPage(this.indexPage);
}
