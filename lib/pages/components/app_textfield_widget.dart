import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_gall/blocs/auth_bloc/auth_bloc.dart';
import 'package:test_gall/theme/app_colors.dart';

// ignore: must_be_immutable
class AppTextField extends StatefulWidget {
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
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  TextEditingController textEditingController = TextEditingController();
  changeText() {
    setState(() {
      String type = widget.labelText;

      switch (type) {
        case "User Name":
          BlocProvider.of<AuthBloc>(context)
              .add(ValidateInputUserName(textEditingController.text));
          break;
        case "Birthday":
          BlocProvider.of<AuthBloc>(context)
              .add(ValidateInputBirthday(textEditingController.text));
          break;
        case "Email":
          BlocProvider.of<AuthBloc>(context)
              .add(ValidateInputEmail(textEditingController.text));
          break;
        case "Password":
          BlocProvider.of<AuthBloc>(context)
              .add(ValidateInputPassword(textEditingController.text));
          break;
        case "Confirm password":
          BlocProvider.of<AuthBloc>(context)
              .add(ValidateInputConfirmPassword(textEditingController.text));
          break;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController.addListener(changeText);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              labelText: widget.labelText,
              counterText: widget.helpText,
              suffixText: widget.isNecessarily ? '*' : "",
              suffixStyle: const TextStyle(color: AppColors.error),
              suffixIcon: widget.icon,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 14.0, horizontal: 10),
              isCollapsed: true,
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide:
                      const BorderSide(color: AppColors.error, width: 1)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide:
                      const BorderSide(color: AppColors.blue, width: 1)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide:
                      const BorderSide(color: AppColors.mainGrey, width: 1)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
            ));
      },
    );
  }
}
