part of 'image_bloc.dart';

@immutable
abstract class ImageEvent {}

class ShowNewImages extends ImageEvent {}

class ShowPopularImages extends ImageEvent {}
