import 'package:flutter/material.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';

/// The text field used in [LoginForm] and [RegisterForm]
///
///
class AuthFormField extends StatelessWidget {
  final String labelText;
  final IconData prefixIconData;
  final IconButton visibilityIconButton;
  final String hintText;
  final bool obscureText;
  final void Function(String value) onChanged;
  final String Function(String value) validator;
  const AuthFormField(
      {Key key,
      @required this.labelText,
      @required this.prefixIconData,
      this.visibilityIconButton,
      this.hintText,
      this.obscureText = false,
      @required this.onChanged,
      @required this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        cursorColor: primaryColor,
        autocorrect: false,
        decoration: InputDecoration(
            prefixIcon: Icon(
              prefixIconData,
              color: primaryColorDark,
            ),
            suffixIcon: visibilityIconButton,
            hintText: hintText,
            labelText: labelText,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(7.0))),
        obscureText: obscureText,
        onChanged: onChanged, // fire an event
        validator: validator);
  }
}
