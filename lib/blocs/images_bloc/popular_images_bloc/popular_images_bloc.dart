import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:http_auth/http_auth.dart';
import 'package:meta/meta.dart';
import 'package:test_gall/blocs/images_bloc/model/image_model.dart';
import 'package:test_gall/blocs/images_bloc/model/new_images_model.dart';

part 'popular_images_event.dart';
part 'popular_images_state.dart';

class PopularImagesBloc extends Bloc<PopularImagesEvent, PopularImagesState> {
  PopularImagesBloc() : super(PopularImagesInitial(_items));
  static List<ItemImage> _items = [];
  static int _page = 1;
  @override
  Stream<PopularImagesState> mapEventToState(
    PopularImagesEvent event,
  ) async* {
    if (event is ShowPopularImages) {
      if (_items.isEmpty) {
        add(AddPopularImages());
      } else {
        yield PopularImagesInitial(_items);
      }
    }

    if (event is AddPopularImages) {
      final _response = await get(Uri.parse(
          "http://gallery.dev.webant.ru/api/photos?popular=true&page=$_page&limit=10"));
      final _result = itemsNewImagesFromJson(_response.body);

      for (int i = 0; i <= 9; i++) {
        int _id = _result.data![i].image!.id;
        print(_id);
        final _responseImage = await get(Uri.parse(
                "http://gallery.dev.webant.ru/api/media_objects/${_id}"))
            .catchError(onError);
        final _resultImage = itemImageFromJson(_responseImage.body);
        _items.add(_resultImage);
        yield ShowPopularImageState(_items);
      }
      _page++;
    }
  }
}
