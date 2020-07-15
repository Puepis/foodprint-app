import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/application/restaurants/manual_search/manual_search_bloc.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/auth/value_objects.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/common/snackbar.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';

class SaveDetailsForm extends StatefulWidget {
  final JWT token;
  final RestaurantEntity restaurant;
  final File imageFile;
  final FoodprintEntity oldFoodprint;
  const SaveDetailsForm(
      {Key key,
      @required this.imageFile,
      @required this.restaurant,
      @required this.oldFoodprint,
      @required this.token})
      : super(key: key);
  @override
  _SaveDetailsFormState createState() => _SaveDetailsFormState();
}

class _SaveDetailsFormState extends State<SaveDetailsForm> {
  final _formKey = GlobalKey<FormState>();

  String _itemName = "";
  String _price = "";
  String _comments = "";

  TextStyle sectionTitleStyle = const TextStyle(
      color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18.0);

  SizedBox sectionHeadingSpace = const SizedBox(
    height: 10.0,
  );

  SizedBox sectionSpace = const SizedBox(
    height: 10.0,
  );

  Row sectionTitle({String title, IconData iconData}) => Row(
        children: [
          Icon(iconData),
          const SizedBox(
            width: 5.0,
          ),
          Text(title, style: sectionTitleStyle),
        ],
      );

  @override
  Widget build(BuildContext context) {
    final photoBloc = context.bloc<PhotoActionsBloc>();
    final foodprintBloc = context.bloc<FoodprintBloc>();

    return BlocListener<PhotoActionsBloc, PhotoActionsState>(
      listener: (context, state) {
        if (state is ActionInProgress) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(loadingSnackbar(text: "Saving photo"));
        }
        if (state is SaveSuccess) {
          int count = 0;
          Navigator.popUntil(context, (route) => count++ == 3);

          // Refresh home page
          foodprintBloc.add(FoodprintEvent.localFoodprintUpdated(
              newFoodprint: state.newFoodprint));
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionTitle(title: "Item Name", iconData: Icons.restaurant_menu),
            sectionHeadingSpace,
            TextFormField(
              cursorColor: primaryColor,
              maxLength: 50,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.0)),
                hintText: 'What are you eating/drinking?',
              ),
              onSaved: (String value) {
                _itemName = value.trim();
              },
              validator: (String value) {
                return value.isEmpty
                    ? 'Please enter the name of the item'
                    : null;
              },
            ),
            sectionSpace,
            sectionTitle(title: "Price", iconData: Icons.attach_money),
            sectionHeadingSpace,
            TextFormField(
              cursorColor: primaryColor,
              maxLength: 8,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "How much is it?",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.0)),
              ),
              onSaved: (String value) {
                _price = value.trim();
              },
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Please enter a price';
                }
                try {
                  final double price = double.parse(value);
                  if (price < 0) {
                    return 'Please enter a non-negative value';
                  }
                  if (price >= 10000) {
                    return 'Price too high';
                  }
                  return null; // valid
                } on FormatException {
                  return 'Please enter a valid price';
                }
              },
            ),
            sectionSpace,
            sectionTitle(title: "Comments", iconData: Icons.rate_review),
            sectionHeadingSpace,
            TextFormField(
                cursorColor: primaryColor,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                maxLength: 200,
                decoration: InputDecoration(
                  hintText: "Any thoughts?",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0)),
                ),
                onSaved: (String value) {
                  _comments = value.trim();
                },
                validator: (String value) {
                  return null;
                }),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 7.0),
                child: FloatingActionButton.extended(
                  backgroundColor: primaryColor,
                  label: const Text(
                    'SAVE PHOTO',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500),
                  ),
                  icon: const Icon(
                    Icons.save_alt,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      // Get user id
                      final UserID id = UserID(JWT.getDecodedPayload(
                          widget.token.getOrCrash())['sub'] as int);

                      // Save fields
                      _formKey.currentState.save();

                      // Fire off save event
                      photoBloc.add(PhotoActionsEvent.saved(
                          userID: id,
                          imageFile: widget.imageFile,
                          itemName: _itemName,
                          price: _price,
                          comments: _comments,
                          restaurant: widget.restaurant,
                          foodprint: widget.oldFoodprint));

                      // Reset manual search state
                      context.bloc<ManualSearchBloc>().add(ResetManualSearch());
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
