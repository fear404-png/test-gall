import 'package:flutter/material.dart';
import 'package:test_gall/pages/components/app_button_widget.dart';
import 'package:test_gall/resources/app_svg.dart';
import 'package:test_gall/theme/app_colors.dart';
import 'package:test_gall/until/app_paddings.dart';

import 'components/app_button_negative_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: AppPaddings.screenPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppSvg.logo,
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Welcome!",
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                  color: AppColors.accent,
                  fontSize: 25),
            ),
            const SizedBox(
              height: 40,
            ),
            const AppButtonNegative(
              text: "Create an account",
              width: double.infinity,
              height: 44,
              fontSize: 14,
              route: "/sign_up_screen",
            ),
            const SizedBox(
              height: 10,
            ),
            const AppButtonDefault(
                text: "I already have an account",
                width: double.infinity,
                height: 44,
                fontSize: 14,
                route: "/sign_in_screen",
                lineColor: AppColors.accent),
          ],
        ),
      ),
    );
  }
}
