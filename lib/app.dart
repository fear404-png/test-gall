import 'package:flutter/material.dart';
import 'package:test_gall/pages/splash_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "test",
      routes: {
        "splash_screen": (context) => const SplashScreen(),
      },
      initialRoute: "splash_screen",
    );
  }
}
