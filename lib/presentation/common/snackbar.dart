import 'package:flutter/material.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';

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
