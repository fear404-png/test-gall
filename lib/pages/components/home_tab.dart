import 'package:flutter/material.dart';
import 'package:test_gall/theme/app_colors.dart';

class HomeTab extends StatelessWidget {
  final String title;
  final bool isTap;
  const HomeTab({
    Key? key,
    required this.title,
    required this.isTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 25,
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 17,
                  color: isTap ? AppColors.accent : AppColors.mainGrey),
            ),
            Expanded(
              child: Container(
                height: 1,
                color: isTap ? AppColors.headerLine : AppColors.background,
              ),
            )
          ],
        ),
      ),
    );
  }
}
