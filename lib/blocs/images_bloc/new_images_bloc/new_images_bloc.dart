import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:http_auth/http_auth.dart';
import 'package:meta/meta.dart';
import 'package:test_gall/blocs/images_bloc/model/image_model.dart';
import 'package:test_gall/blocs/images_bloc/model/new_images_model.dart';

part 'new_images_event.dart';
part 'new_images_state.dart';

class NewImagesBloc extends Bloc<NewImagesEvent, NewImagesState> {
  NewImagesBloc() : super(NewImagesInitial(_items));

  static List<ItemImage> _items = [];
  static int _page = 1;

  @override
  Stream<NewImagesState> mapEventToState(
    NewImagesEvent event,
  ) async* {
    if (event is ShowNewImages) {
      if (_items.isEmpty) {
        add(AddNewImages());
      } else {
        yield NewImagesInitial(_items);
      }
    }

    if (event is AddNewImages) {
      final _response = await BasicAuthClient('', '').get(Uri.parse(
          "http://gallery.dev.webant.ru/api/photos?new=true&page=$_page&limit=10"));
      final _result = itemsNewImagesFromJson(_response.body);

      for (int i = 0; i <= 9; i++) {
        int _id = _result.data![i].image!.id;
        print(_id);
        final _responseImage = await BasicAuthClient('', '')
            .get(Uri.parse(
                "http://gallery.dev.webant.ru/api/media_objects/${_id}"))
            .catchError(onError);
        final _resultImage = itemImageFromJson(_responseImage.body);
        _items.add(_resultImage);
        yield ShowNewImageState(_items);
      }
      _page++;
    }
  }
}
