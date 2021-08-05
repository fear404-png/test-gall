import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_gall/blocs/auth_bloc/auth_bloc.dart';
import 'package:test_gall/theme/app_colors.dart';

class AppButtonNegative extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final double fontSize;
  final String route;
  final AuthEvent? event;

  const AppButtonNegative({
    Key? key,
    required this.text,
    this.width,
    this.height,
    required this.fontSize,
    required this.route,
    this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          if (event != null) {
            BlocProvider.of<AuthBloc>(context).add(event!);
          }

          Navigator.of(context).pushReplacementNamed(route);
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.accent),
            minimumSize: (width != null && height != null)
                ? MaterialStateProperty.all(Size(width!, height!))
                : MaterialStateProperty.all(const Size(double.infinity, 36)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: const BorderSide(color: AppColors.background)))),
        child: Text(
          text,
          style: const TextStyle(
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: AppColors.background),
        ));
  }
}
