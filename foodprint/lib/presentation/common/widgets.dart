import 'package:flutter/material.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/core/styles/text_styles.dart';

SnackBar loadingSnackbar({String text}) {
  return SnackBar(
    backgroundColor: foodprintPrimaryColorSwatch[700],
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$text...',
          style: const TextStyle(fontSize: 18.0),
        ),
        const SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      ],
    ),
  );
}

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
