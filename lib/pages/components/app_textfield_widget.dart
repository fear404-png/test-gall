import 'package:flutter/material.dart';
import 'package:test_gall/theme/app_colors.dart';

class AppTextField extends StatelessWidget {
  final String labelText;
  final Icon icon;

  const AppTextField({
    Key? key,
    required this.labelText,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
      labelText: labelText,
      suffixIcon: icon,
      contentPadding:
          const EdgeInsets.symmetric(vertical: 14.0, horizontal: 10),
      isCollapsed: true,
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: AppColors.error, width: 1)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: AppColors.blue, width: 1)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: AppColors.mainGrey, width: 1)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
    ));
  }
}
