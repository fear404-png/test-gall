part of 'popular_images_bloc.dart';

@immutable
abstract class PopularImagesState {
  final List<ItemImage> items;

  PopularImagesState(this.items);
}

class PopularImagesInitial extends PopularImagesState {
  PopularImagesInitial(List<ItemImage> items) : super(items);
}

class ShowPopularImageState extends PopularImagesState {
  ShowPopularImageState(List<ItemImage> items) : super(items);
}
