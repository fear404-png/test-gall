import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_gall/blocs/images_bloc/image_bloc.dart';
import 'package:test_gall/pages/main_screen.dart';
import 'package:test_gall/pages/sign_in_screen.dart';
import 'package:test_gall/pages/sign_up_screen.dart';
import 'package:test_gall/pages/splash_screen.dart';
import 'package:test_gall/pages/welcome_screen.dart';
import 'package:test_gall/theme/app_colors.dart';

import 'blocs/main_screen_bloc/main_screen_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainScreenBloc>(
          create: (BuildContext context) => MainScreenBloc(),
        ),
        BlocProvider<ImageBloc>(
          create: (BuildContext context) => ImageBloc()..add(ShowNewImages()),
        )
      ],
      child: MaterialApp(
        title: "test",
        theme: ThemeData(
            appBarTheme:
                const AppBarTheme(backgroundColor: AppColors.background),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: AppColors.background,
                selectedItemColor: AppColors.headerLine,
                unselectedItemColor: AppColors.grey)),
        routes: {
          "/splash_screen": (context) => const SplashScreen(),
          "/welcome_screen": (context) => const WelcomeScreen(),
          "/sign_in_screen": (context) => const SignInScreen(),
          "/sign_up_screen": (context) => const SignUpScreen(),
          "/main_screen": (context) => const MainScreen(),
        },
        initialRoute: "/welcome_screen",
      ),
    );
  }
}
