import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/auth/value_objects.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';

class SaveDetailsForm extends StatefulWidget {
  final UserID userID;
  final RestaurantEntity restaurant;
  final File imageFile;
  final FoodprintEntity oldFoodprint;
  const SaveDetailsForm(
      {Key key,
      @required this.imageFile,
      @required this.restaurant,
      @required this.userID,
      @required this.oldFoodprint})
      : super(key: key);
  @override
  _SaveDetailsFormState createState() => _SaveDetailsFormState();
}

class _SaveDetailsFormState extends State<SaveDetailsForm> {
  final _formKey = GlobalKey<FormState>();

  String _itemName = "";
  String _price = "";
  String _comments = "";

  @override
  Widget build(BuildContext context) {
    final photoBloc = context.bloc<PhotoActionsBloc>();
    final foodprintBloc = context.bloc<FoodprintBloc>();

    return BlocListener<PhotoActionsBloc, PhotoActionsState>(
      listener: (context, state) {
        if (state is ActionInProgress) {
          Scaffold.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Saving photo...'),
                  CircularProgressIndicator(),
                ],
              ),
            ),
          );  
        }
        if (state is SaveSuccess) {
          foodprintBloc.add(FoodprintEvent.localFoodprintUpdated(
              newFoodprint: state.newFoodprint));

          // pop back to home page
          int count = 0;
          Navigator.popUntil(context, (route) => count++ == 3);
        }
      },
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  icon: Icon(Icons.restaurant_menu),
                  hintText: 'What are you eating/drinking?',
                  labelText: 'Item Name',
                ),
                onSaved: (String value) {
                  _itemName = value.trim();
                },
                validator: (String value) {
                  // TODO: price validation
                  return value.isEmpty
                      ? 'Please enter the name of the item'
                      : null;
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                maxLength: 8,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon: Icon(Icons.attach_money),
                  labelText: 'Price',
                ),
                onSaved: (String value) {
                  _price = value.trim();
                },
                validator: (String value) {
                  return value.isEmpty ? 'Please enter the price' : null;
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  maxLength: 200,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.rate_review),
                    labelText: 'Comments',
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
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: FloatingActionButton.extended(
                    label: const Text(
                      'SAVE',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    icon: const Icon(Icons.save_alt),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save(); // save fields
                        photoBloc.add(PhotoActionsEvent.saved(
                            userID: widget.userID,
                            imageFile: widget.imageFile,
                            itemName: _itemName,
                            price: _price,
                            comments: _comments,
                            restaurant: widget.restaurant,
                            foodprint: widget.oldFoodprint));
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
