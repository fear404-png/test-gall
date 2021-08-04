import 'package:flutter/material.dart';
import 'package:test_gall/pages/components/app_button_negative_widget.dart';
import 'package:test_gall/pages/components/app_button_widget.dart';
import 'package:test_gall/theme/app_colors.dart';
import 'package:test_gall/until/app_paddings.dart';

import 'components/app_textfield_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
                "Sign Up",
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
              AppTextField(
                  labelText: "User Name",
                  icon: const Icon(Icons.person_outline)),
              const SizedBox(
                height: 30,
              ),
              AppTextField(
                labelText: "Birthday",
                icon: Icon(Icons.calendar_today),
              ),
              const SizedBox(
                height: 30,
              ),
              AppTextField(
                  labelText: "Email", icon: const Icon(Icons.mail_outline)),
              const SizedBox(
                height: 30,
              ),
              AppTextField(
                labelText: "Password",
                icon: const Icon(Icons.visibility_outlined),
              ),
              const SizedBox(
                height: 30,
              ),
              AppTextField(
                labelText: "Confirm password",
                icon: const Icon(Icons.visibility_outlined),
              ),
              const SizedBox(
                height: 45,
              ),
              const AppButtonNegative(
                text: "Sign Up",
                fontSize: 17,
                route: "/main_screen",
                width: 120,
                height: 42,
              ),
              const SizedBox(
                height: 10,
              ),
              AppButtonDefault(
                text: "Sign In",
                fontSize: 17,
                route: "/sign_in_screen",
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