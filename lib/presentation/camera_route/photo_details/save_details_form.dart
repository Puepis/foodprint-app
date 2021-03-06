import 'dart:io';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/application/restaurants/manual_search/manual_search_bloc.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/data/user_data.dart';
import 'package:foodprint/presentation/walkthrough/walkthrough.dart';
import 'package:provider/provider.dart';

/// The form that users fill out which describes the photo that they have taken.
class SaveDetailsForm extends StatefulWidget {
  final RestaurantEntity restaurant;
  final File imageFile;
  final VoidCallback onSave;
  const SaveDetailsForm({
    Key key,
    @required this.imageFile,
    @required this.restaurant,
    @required this.onSave,
  })  : assert(onSave != null),
        super(key: key);
  @override
  _SaveDetailsFormState createState() => _SaveDetailsFormState();
}

class _SaveDetailsFormState extends State<SaveDetailsForm> {
  final _formKey = GlobalKey<FormState>();
  String _itemName, _price, _comments;

  final TextStyle _sectionTitleStyle = const TextStyle(
      color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18.0);

  final TextStyle _hintStyle =
      TextStyle(color: Colors.grey.shade500, fontSize: 16.0);

  final SizedBox _sectionHeadingSpace = const SizedBox(
    height: 10.0,
  );

  final SizedBox _sectionSpace = const SizedBox(
    height: 10.0,
  );

  final textfieldBorder =
      OutlineInputBorder(borderRadius: BorderRadius.circular(7.0));

  Row _buildSectionTitle(
          {String title, IconData iconData, Color iconColor = Colors.black}) =>
      Row(
        children: [
          Icon(
            iconData,
            color: iconColor,
          ),
          const SizedBox(
            width: 5.0,
          ),
          Text(title, style: _sectionTitleStyle),
        ],
      );

  @override
  Widget build(BuildContext context) {
    final photoBloc = context.bloc<PhotoActionsBloc>();
    final userData = context.watch<UserData>();

    return BlocConsumer<PhotoActionsBloc, PhotoActionsState>(
        listener: (context, state) {
      if (state is SaveFailure) {
        Scaffold.of(context)..hideCurrentSnackBar();
        FlushbarHelper.createError(
          message: state.failure.map(
              invalidPhoto: (_) => 'Invalid Photo',
              serverError: (_) => 'Server Error',
              noInternet: (_) => 'No internet connection'),
        ).show(context);
      }
      if (state is SaveSuccess) {
        userData.addPhoto(widget.restaurant, state.newPhoto);
        widget.onSave();
      }
    }, builder: (context, state) {
      return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSectionTitle(
                title: "Item Name", iconData: Icons.restaurant_menu),
            _sectionHeadingSpace,
            TextFormField(
              cursorColor: primaryColor,
              maxLength: 50,
              decoration: InputDecoration(
                hintStyle: _hintStyle,
                border: textfieldBorder,
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
            _sectionSpace,
            _buildSectionTitle(
                title: "Price",
                iconData: Icons.attach_money,
                iconColor: Colors.green),
            _sectionHeadingSpace,
            TextFormField(
              cursorColor: primaryColor,
              maxLength: 8,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "How much is it?",
                  hintStyle: _hintStyle,
                  border: textfieldBorder),
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
            _sectionSpace,
            _buildSectionTitle(
                title: "Comments",
                iconData: Icons.rate_review,
                iconColor: foodprintPrimaryColorSwatch[600]),
            _sectionHeadingSpace,
            TextFormField(
                cursorColor: primaryColor,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                maxLength: 200,
                decoration: InputDecoration(
                  hintStyle: _hintStyle,
                  hintText: "Any thoughts?",
                  border: textfieldBorder,
                ),
                onSaved: (String value) {
                  _comments = value.trim();
                },
                validator: (String value) {
                  return null;
                }),
            _buildSaveButton(state, photoBloc, userData)
          ],
        ),
      );
    });
  }

  Align _buildSaveButton(PhotoActionsState state, PhotoActionsBloc photoBloc,
          UserData userData) =>
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 7.0),
          child: FloatingActionButton.extended(
            backgroundColor: primaryColorDark,
            label: const Text(
              'SAVE PHOTO',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500),
            ),
            icon: (state is ActionInProgress)
                ? const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.0),
                    child: SpinKitRing(
                      lineWidth: 3,
                      color: Colors.white,
                      size: 18,
                    ),
                  )
                : const Icon(
                    Icons.save_alt,
                    color: Colors.white,
                  ),
            onPressed: (state is ActionInProgress)
                ? null
                : () {
                    if (_formKey.currentState.validate()) {
                      // Save fields
                      _formKey.currentState.save();

                      // Move to next walkthrough step
                      final walkthrough = context.read<WalkthroughModel>();
                      if (walkthrough.enabled && walkthrough.screen == 6) {
                        walkthrough.next();
                      }

                      // Fire off save event
                      photoBloc.add(PhotoActionsEvent.saved(
                        accessToken: userData.token,
                        imageFile: widget.imageFile,
                        itemName: _itemName,
                        price: _price,
                        comments: _comments,
                        placeID: widget.restaurant.id,
                      ));

                      // Reset manual search state
                      context.bloc<ManualSearchBloc>().add(ResetManualSearch());
                    }
                  },
          ),
        ),
      );
}
