import 'package:flutter/material.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/core/styles/text_styles.dart';

ButtonTheme loadingButton({String text}) {
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
                Text(text, style: buttonText),
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

