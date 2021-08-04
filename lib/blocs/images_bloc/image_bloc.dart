import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:http_auth/http_auth.dart';
import 'package:meta/meta.dart';
import 'package:test_gall/blocs/images_bloc/model/image_model.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc() : super(ImageInitial());

  static List<ItemImage> _items = [];
  int _imageCount = 1;

  @override
  Stream<ImageState> mapEventToState(
    ImageEvent event,
  ) async* {
    if (event is ShowNewImages) {
      for (int i = 0; i <= 10; i++) {
        final _client = BasicAuthClient('', '');
        final _response = await _client.get(Uri.parse(
            "http://gallery.dev.webant.ru/api/media_objects/$_imageCount"));
        final _result = itemImageFromJson(_response.body);
        print("wqewq");
        _items.add(_result);
        _imageCount++;
        yield LoadNewImages(_items);
      }
    }
    if (event is ShowPopularImages) {
      _getNewImage();
      yield LoadPoularImages(_items);
    }
  }

  _getNewImage() async* {}
}
