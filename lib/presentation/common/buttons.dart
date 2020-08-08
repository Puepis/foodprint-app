import 'package:flutter/material.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/core/styles/text_styles.dart';

class AuthIdleButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  const AuthIdleButton(
      {Key key, @required this.title, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 50,
      child: RaisedButton(
          color: primaryColorDark,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
          ),
          onPressed: onPressed,
          child: Text(title, style: buttonTextStyle)),
    );
  }
}

class AuthLoadingButton extends StatelessWidget {
  final String title;
  const AuthLoadingButton({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 50,
      child: RaisedButton(
          color: primaryColorDark,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
          ),
          onPressed: () => null,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title, style: buttonTextStyle),
                ],
              ),
              const SizedBox(
                height: 21,
                width: 21,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ],
          )),
    );
  }
}
