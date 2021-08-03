import 'package:flutter/material.dart';
import 'package:test_gall/resources/app_svg.dart';
import 'package:test_gall/theme/app_colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppSvg.logo,
              const SizedBox(
                height: 40,
              ),
              Text(
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
              TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.accent),
                      minimumSize: MaterialStateProperty.all(
                          const Size(double.infinity, 44)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: BorderSide(color: AppColors.background)))),
                  child: Text(
                    "Create an account",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: AppColors.background),
                  )),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.background),
                      minimumSize: MaterialStateProperty.all(
                          const Size(double.infinity, 44)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: BorderSide(color: AppColors.accent)))),
                  child: Text(
                    "I already have an account",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: AppColors.accent),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
