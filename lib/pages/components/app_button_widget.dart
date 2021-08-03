import 'package:flutter/material.dart';
import 'package:test_gall/theme/app_colors.dart';

class AppButtonDefault extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  const AppButtonDefault({
    Key? key,
    required this.text,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.background),
            minimumSize: MaterialStateProperty.all(Size(width!, height!)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: BorderSide(color: AppColors.accent)))),
        child: Text(
          text,
          style: TextStyle(
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: AppColors.accent),
        ));
  }
}
