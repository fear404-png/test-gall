import 'package:flutter/material.dart';
import 'package:test_gall/resources/app_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: AppSvg.appLogo,
    ));
  }
}
