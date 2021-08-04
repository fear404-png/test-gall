import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_gall/blocs/bloc/main_screen_bloc.dart';

import 'package:test_gall/theme/app_colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onTap(int index) {
      BlocProvider.of<MainScreenBloc>(context).add(SetPage(index));
    }

    return BlocBuilder<MainScreenBloc, MainScreenState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.background,
            shadowColor: AppColors.grey,
            elevation: 1,
          ),
          body: state.curretWidget,
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.camera), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
            ],
            onTap: onTap,
            currentIndex: state.index,
          ),
        );
      },
    );
  }
}
