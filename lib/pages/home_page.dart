import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:test_gall/blocs/images_bloc/image_bloc.dart';
import 'package:test_gall/blocs/main_screen_bloc/main_screen_bloc.dart';

import 'package:test_gall/theme/app_colors.dart';

import 'components/home_tabs.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageBloc, ImageState>(
      builder: (context, state) {
        return Column(
          children: [
            HomeTabs(),
            state is LoadNewImages
                ? Expanded(
                    child: GridView.builder(
                        itemCount: state.items.length,
                        gridDelegate:
                            new SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (context, index) {
                          try {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Image.memory(base64Decode(
                                      state.items[index].file!.split(',')[1])),
                                ),
                              ),
                            );
                          } catch (e) {
                            print(e);
                            return Container(
                              color: Colors.black,
                            );
                          }
                        }),
                  )
                : Center(
                    child: CircularProgressIndicator(
                      color: AppColors.grey,
                    ),
                  )
          ],
        );
      },
    );
  }
}
