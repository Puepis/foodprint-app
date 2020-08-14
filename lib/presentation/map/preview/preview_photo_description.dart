import 'package:flutter/material.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:intl/intl.dart';

class PreviewPhotoDescription extends StatelessWidget {
  const PreviewPhotoDescription({
    Key key,
    @required this.constraints,
    @required this.photo,
  }) : super(key: key);

  final BoxConstraints constraints;
  final PhotoEntity photo;

  @override
  Widget build(BuildContext context) {
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(photo.details.name.getOrCrash(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(
              height: 5,
            ),
            Text(
              formatter.format(photo.details.price.getOrCrash()),
              style: TextStyle(
                  color: Colors.green.shade500,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "COMMENTS",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 40,
                    child:
                        Divider(height: 10, thickness: 2, color: primaryColor),
                  ),
                  Text(
                    photo.details.comments.getOrCrash(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
