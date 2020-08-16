import 'package:flutter/material.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/core/styles/gradients.dart';
import 'package:foodprint/presentation/gallery/edit/edit_image_form.dart';

class EditImagePage extends StatefulWidget {
  static const routeName = "edit_image/";
  final PhotoEntity photo;
  final RestaurantEntity restaurant;
  final VoidCallback onEdit;
  const EditImagePage(
      {Key key, @required this.photo, @required this.restaurant, this.onEdit})
      : super(key: key);
  @override
  _EditImagePageState createState() => _EditImagePageState();
}

class _EditImagePageState extends State<EditImagePage> {
  Color get backgroundColor => Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: cloudsGradient),
      ),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: backgroundColor,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            body: Padding(
                padding: const EdgeInsets.all(20),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Text(
                      "Edit the details!",
                      style: TextStyle(
                          color: primaryColorDark,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 2.5,
                    ),
                    const Text(
                      "Feel free to make any changes",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    EditImageForm(
                        onEdit: widget.onEdit,
                        photo: widget.photo,
                        restaurant: widget.restaurant),
                  ],
                ))),
      ),
    );
  }
}
