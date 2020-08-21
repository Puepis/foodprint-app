import 'package:flutter/material.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/gallery/edit/edit_image_form.dart';
import 'package:visibility_detector/visibility_detector.dart';

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
  bool _showAppBarTitle = false;
  Color get backgroundColor => Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            centerTitle: true,
            title: _showAppBarTitle
                ? const Text(
                    "Edit the details!",
                    style: TextStyle(color: Colors.black),
                  )
                : null,
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
          body: ListView(
            shrinkWrap: true,
            children: [
              VisibilityDetector(
                key: const Key("title"),
                onVisibilityChanged: (info) {
                  // Show app bar title if scrolled out of view
                  if (mounted) {
                    setState(() {
                      _showAppBarTitle = info.visibleFraction == 0;
                    });
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                    "Edit the details!",
                    style: TextStyle(
                        color: primaryColorDark,
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 2.5),
                child: Text(
                  "Feel free to make any changes",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: EditImageForm(
                    onEdit: widget.onEdit,
                    photo: widget.photo,
                    restaurant: widget.restaurant),
              ),
            ],
          )),
    );
  }
}
