import 'package:flutter/material.dart';
import 'package:test_gall/pages/sign_in_screen.dart';
import 'package:test_gall/pages/splash_screen.dart';
import 'package:test_gall/pages/welcome_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "test",
      routes: {
        "/splash_screen": (context) => const SplashScreen(),
        "/welcome_screen": (context) => const WelcomeScreen(),
        "/sign_in_screen": (context) => const SignInScreen(),
      },
      initialRoute: "/welcome_screen",
    );
  }
}
