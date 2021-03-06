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
      backgroundColor: AppColors.background,
      appBar: AppBar(
          backgroundColor: AppColors.background,
          shadowColor: AppColors.grey,
          elevation: 1,
          title: TextButton(
            onPressed: () =>
                Navigator.of(context).pushReplacementNamed("/welcome_screen"),
            child: const Text(
              "Cancel",
              style: TextStyle(
                fontFamily: "Roboto",
                color: AppColors.accent,
                fontSize: 15,
              ),
            ),
          )),
      body: Padding(
        padding: AppPaddings.screenPadding,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign In",
                style: TextStyle(
                    color: AppColors.accent,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              Container(
                width: 95,
                height: 2,
                decoration: const BoxDecoration(color: AppColors.error),
              ),
              const SizedBox(
                height: 50,
              ),
              AppTextField(
                labelText: "Email",
                icon: const Icon(Icons.mail_outline),
                isNecessarily: false,
              ),
              const SizedBox(
                height: 30,
              ),
              AppTextField(
                  labelText: "Password",
                  icon: const Icon(Icons.visibility_outlined),
                  isNecessarily: false,
                  helpText: "Forgot login or password?"),
              const SizedBox(
                height: 45,
              ),
              const AppButtonNegative(
                text: "Sign In",
                fontSize: 17,
                route: "/sign_up_screen",
                width: 120,
                height: 42,
              ),
              const SizedBox(
                height: 10,
              ),
              const AppButtonDefault(
                text: "Sign Up",
                fontSize: 17,
                route: "/sign_up_screen",
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
