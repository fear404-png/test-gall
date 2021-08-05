part of 'new_images_bloc.dart';

@immutable
abstract class NewImagesEvent {}

class AddNewImages extends NewImagesEvent {}

class ShowNewImages extends NewImagesEvent {}
