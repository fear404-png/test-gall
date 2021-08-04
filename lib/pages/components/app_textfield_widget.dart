import 'package:flutter/material.dart';
import 'package:test_gall/theme/app_colors.dart';

// ignore: must_be_immutable
class AppTextField extends StatelessWidget {
  final String labelText;
  final Icon icon;
  String? helpText = "";
  bool isNecessarily = false;

  AppTextField({
    Key? key,
    required this.labelText,
    required this.icon,
    this.helpText,
    required this.isNecessarily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
      labelText: labelText,
      counterText: helpText,
      suffixText: isNecessarily ? '*' : "",
      suffixStyle: const TextStyle(color: AppColors.error),
      suffixIcon: icon,
      contentPadding:
          const EdgeInsets.symmetric(vertical: 14.0, horizontal: 10),
      isCollapsed: true,
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.error, width: 1)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.blue, width: 1)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.mainGrey, width: 1)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
    ));
  }
}
