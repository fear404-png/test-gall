import 'package:flutter/material.dart';
import 'package:test_gall/theme/app_colors.dart';

class AppButtonDefault extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final double fontSize;
  final String route;
  final Color lineColor;

  const AppButtonDefault({
    Key? key,
    required this.text,
    this.width,
    this.height,
    required this.fontSize,
    required this.route,
    required this.lineColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => Navigator.of(context).pushReplacementNamed(route),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.background),
            minimumSize: MaterialStateProperty.all(Size(width!, height!)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: BorderSide(color: lineColor)))),
        child: Text(
          text,
          style: const TextStyle(
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: AppColors.accent),
        ));
  }
}
