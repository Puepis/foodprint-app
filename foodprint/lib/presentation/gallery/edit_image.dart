import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditImageScreen extends StatefulWidget {
  final FoodprintEntity foodprint;
  final PhotoEntity photo;
  final RestaurantEntity restaurant;
  const EditImageScreen(
      {Key key,
      @required this.photo,
      @required this.foodprint,
      @required this.restaurant})
      : super(key: key);
  @override
  _EditImageScreenState createState() => _EditImageScreenState();
}

class _EditImageScreenState extends State<EditImageScreen> {
  final _formKey = GlobalKey<FormState>();

  bool saving = false;
  String _itemName = "";
  String _price = "";
  String _comments = "";

  @override
  Widget build(BuildContext context) {
    final PhotoActionsBloc photoBloc = context.bloc<PhotoActionsBloc>();
    final FoodprintBloc foodprintBloc = context.bloc<FoodprintBloc>();

    return BlocListener<PhotoActionsBloc, PhotoActionsState>(
      listener: (context, state) {
        if (state is EditSuccess) {
          foodprintBloc.add(FoodprintEvent.localFoodprintUpdated(
              newFoodprint: state.newFoodprint));
          int count = 0;
          Navigator.popUntil(
              context, (route) => count++ == 3); // pop back to gallery
        }
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(120.0),
              child: AppBar(
                centerTitle: true,
                automaticallyImplyLeading: false,
                flexibleSpace: const Center(
                  child: Text(
                    "Edit the details!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
            body: Container(
              margin: const EdgeInsets.fromLTRB(7.5, 10.0, 7.5, 0),
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue:
                            widget.photo.photoDetail.name.getOrCrash(),
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
                        initialValue: widget.photo.photoDetail.price
                            .getOrCrash()
                            .toString(),
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
                          return value.isEmpty
                              ? 'Please enter the price'
                              : null;
                        },
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                          initialValue:
                              widget.photo.photoDetail.comments.getOrCrash(),
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
                          child: saving
                              ? const SpinKitThreeBounce(
                                  color: Colors.orange, size: 15.0)
                              : FloatingActionButton.extended(
                                  label: const Text(
                                    'SAVE',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  icon: const Icon(Icons.save_alt),
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();
                                      photoBloc.add(PhotoActionsEvent.edited(
                                          oldPhoto: widget.photo,
                                          newName: _itemName,
                                          newPrice: _price,
                                          newComments: _comments,
                                          restaurant: widget.restaurant,
                                          foodprint: widget.foodprint));
                                    }
                                  },
                                ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
