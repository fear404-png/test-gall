import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:test_gall/blocs/images_bloc/new_images_bloc/new_images_bloc.dart';
import 'package:test_gall/blocs/images_bloc/popular_images_bloc/popular_images_bloc.dart';


import 'package:test_gall/blocs/main_screen_bloc/main_screen_bloc.dart';

import 'package:test_gall/theme/app_colors.dart';
import 'package:test_gall/until/app_paddings.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: AppPaddings.screenPadding,
        child: DefaultTabController(
            length: 2,
            child: Column(children: [
              TabBar(
                  onTap: (index) {
                    if (index == 0) {
                      print("new");
                      BlocProvider.of<NewImagesBloc>(context)
                          .add(ShowNewImages());
                    } else {
                      print("popular");
                      BlocProvider.of<PopularImagesBloc>(context)
                          .add(ShowPopularImages());
                    }
                  },
                  indicatorColor: AppColors.headerLine,
                  labelColor: Colors.deepPurpleAccent,
                  tabs: const [
                    Text(
                      "New",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 17,
                          color: AppColors.accent),
                    ),
                    Text(
                      "Poular",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 17,
                          color: AppColors.accent),
                    ),
                  ]),
              Expanded(
                child: TabBarView(
                  children: [
                    BlocBuilder<NewImagesBloc, NewImagesState>(
                        builder: (context, state) {
                      return LazyLoadScrollView(
                          onEndOfPage: () {
                            BlocProvider.of<NewImagesBloc>(context)
                                .add(AddNewImages());
                          },
                          child: GridView.builder(
                              shrinkWrap: true,
                              itemCount: state.items.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1,
                              ),
                              itemBuilder: (context, index) {
                                try {
                                  return Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: Image.memory(base64Decode(state
                                            .items[index].file!
                                            .split(',')[1])),
                                      ),
                                    ),
                                  );
                                } catch (e) {
                                  print(e);
                                  return Container(
                                    color: AppColors.accent,
                                    child: const Center(
                                      child: Text(
                                        "Не удалось загрузить фото =(",
                                        style: TextStyle(
                                            color: AppColors.background),
                                      ),
                                    ),
                                  );
                                }
                              }));
                    }),
                    BlocBuilder<PopularImagesBloc, PopularImagesState>(
                        builder: (context, state) {
                      if (state is ShowPopularImageState) {
                        return LazyLoadScrollView(
                          onEndOfPage: () {
                            BlocProvider.of<PopularImagesBloc>(context)
                                .add(AddPopularImages());
                          },
                          child: GridView.builder(
                              shrinkWrap: true,
                              itemCount: state.items.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1,
                              ),
                              itemBuilder: (context, index) {
                                try {
                                  return Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: Image.memory(base64Decode(state
                                            .items[index].file!
                                            .split(',')[1])),
                                      ),
                                    ),
                                  );
                                } catch (e) {
                                  print(e);
                                  return Container(
                                    color: AppColors.accent,
                                    child: const Center(
                                      child: Text(
                                        "Не удалось загрузить фото =(",
                                        style: TextStyle(
                                            color: AppColors.background),
                                      ),
                                    ),
                                  );
                                }
                              }),
                        );
                      }
                      return LoadingWidget();
                    })
                  ],
                ),
              )
            ])));
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator(
            color: AppColors.grey,
          ),
          Text("Loading...",
              style: TextStyle(
                color: AppColors.grey,
                fontFamily: "Roboto",
              ))
        ],
      ),
    );
  }
}
