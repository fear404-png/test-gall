part of 'image_bloc.dart';

@immutable
abstract class ImageState {}

class ImageInitial extends ImageState {}

class LoadNewImages extends ImageState {
  final List<ItemImage> items;

  LoadNewImages(this.items);
}

class LoadPoularImages extends ImageState {
  final List<ItemImage> items;

  LoadPoularImages(this.items);
}
