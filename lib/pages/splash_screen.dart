import 'package:flutter/material.dart';
import 'package:test_gall/resources/app_svg.dart';
import 'package:test_gall/theme/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: AppSvg.logo,
        ));
  }
}
