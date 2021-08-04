import 'package:flutter/material.dart';
import 'package:test_gall/pages/components/app_button_negative_widget.dart';
import 'package:test_gall/pages/components/app_button_widget.dart';
import 'package:test_gall/theme/app_colors.dart';
import 'package:test_gall/until/app_paddings.dart';

import 'components/app_textfield_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
      ),
      body: Padding(
        padding: AppPaddings.screenPadding,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sigh in",
                style: TextStyle(
                    color: AppColors.accent,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              Container(
                width: 95,
                height: 2,
                decoration: BoxDecoration(color: AppColors.error),
              ),
              const SizedBox(
                height: 50,
              ),
              const AppTextField(
                  labelText: "Email", icon: Icon(Icons.mail_outline)),
              const SizedBox(
                height: 30,
              ),
              const AppTextField(
                  labelText: "Password", icon: Icon(Icons.visibility_outlined)),
              const SizedBox(
                height: 45,
              ),
              AppButtonNegative(
                text: "Sing In",
                fontSize: 17,
                route: "",
                width: 120,
                height: 42,
              ),
              const SizedBox(
                height: 10,
              ),
              AppButtonDefault(
                text: "Sing Up",
                fontSize: 17,
                route: "",
                width: 120,
                height: 42,
                lineColor: AppColors.background,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
