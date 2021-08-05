part of 'new_images_bloc.dart';

@immutable
abstract class NewImagesState {
  final List<ItemImage> items;

  NewImagesState(this.items);
}

class NewImagesInitial extends NewImagesState {
  NewImagesInitial(List<ItemImage> items) : super(items);
}

class ShowNewImageState extends NewImagesState {
  ShowNewImageState(List<ItemImage> items) : super(items);

}
