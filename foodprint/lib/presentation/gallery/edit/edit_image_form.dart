import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/common/widgets.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';

class EditImageForm extends StatefulWidget {
  final PhotoEntity photo;
  final FoodprintEntity foodprint;
  final RestaurantEntity restaurant;
  const EditImageForm(
      {Key key,
      @required this.photo,
      @required this.foodprint,
      @required this.restaurant})
      : super(key: key);

  @override
  _EditImageFormState createState() => _EditImageFormState();
}

class _EditImageFormState extends State<EditImageForm> {
  final _formKey = GlobalKey<FormState>();
  String _itemName, _price, _comments;

  @override
  Widget build(BuildContext context) {
    final PhotoActionsBloc photoBloc = context.bloc<PhotoActionsBloc>();
    final FoodprintBloc foodprintBloc = context.bloc<FoodprintBloc>();

    return BlocConsumer<PhotoActionsBloc, PhotoActionsState>(
        listener: (context, state) {
      // Editing in progress
      if (state is ActionInProgress) {
        Scaffold.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(loadingSnackbar(text: "Updating photo"));
      }

      // Update local foodprint
      if (state is EditSuccess) {
        foodprintBloc.add(FoodprintEvent.localFoodprintUpdated(
            newFoodprint: state.newFoodprint));

        // Pop back to gallery
        int count = 0;
        Navigator.popUntil(context, (route) => count++ == 3);
      }
    }, builder: (context, state) {
      return Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                initialValue: widget.photo.photoDetail.name.getOrCrash(),
                maxLength: 50,
                decoration: const InputDecoration(
                  icon: Icon(Icons.restaurant_menu),
                  labelText: 'Item Name',
                ),
                onSaved: (String value) {
                  _itemName = value.trim();
                },
                validator: (String value) {
                  return value.isEmpty ? 'Please enter an item name' : null;
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                initialValue:
                    widget.photo.photoDetail.price.getOrCrash().toString(),
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
                  // TODO: validate price
                  return value.isEmpty ? 'Please enter a price' : null;
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                  initialValue: widget.photo.photoDetail.comments.getOrCrash(),
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
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 7.0),
                  child: FloatingActionButton.extended(
                      backgroundColor: primaryColor,
                      label: const Text(
                        'UPDATE',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                      ),
                      icon: const Icon(Icons.save_alt),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();

                          // Edit photo
                          photoBloc.add(PhotoActionsEvent.edited(
                              oldPhoto: widget.photo,
                              newName: _itemName,
                              newPrice: _price,
                              newComments: _comments,
                              restaurant: widget.restaurant,
                              foodprint: widget.foodprint));
                        }
                      }),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
