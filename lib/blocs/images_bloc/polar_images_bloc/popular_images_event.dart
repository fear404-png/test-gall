part of 'popular_images_bloc.dart';

@immutable
abstract class PopularImagesEvent {}

class AddPopularImages extends PopularImagesEvent {}

class ShowPopularImages extends PopularImagesEvent {}
