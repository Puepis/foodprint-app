import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodprint/models/places_data/restaurant_result.dart';
import 'package:foodprint/models/user_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ImageDetail extends StatefulWidget {
  final UserModel user;
  final RestaurantResult restaurant;
  final File imageFile;
  const ImageDetail({Key key, @required this.user, @required this.imageFile,
    @required this.restaurant}) : super(key: key);
  @override
  _ImageDetailState createState() => _ImageDetailState();
}

class _ImageDetailState extends State<ImageDetail> {
  final _formKey = GlobalKey<FormState>();

  bool saving = false;
  String _itemName = "";
  String _price = "";
  String _comments = "";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(120.0),
            child: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              flexibleSpace: const Center(
                child: Text(
                  "Fill in the details!",
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
                        return value.isEmpty ? 'Please enter the name of the item' : null;
                      },
                    ),
                    const SizedBox(height: 10.0,),
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
                    const SizedBox(height: 10.0,),
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
                        }
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: saving ? const SpinKitThreeBounce(
                          color: Colors.blue,
                          size: 15.0
                          ) : FloatingActionButton.extended(
                          label: const Text(
                            'SAVE',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          icon: const Icon(Icons.save_alt),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save(); // save fields
                              setState(() {
                                saving = true;
                              });
                              final bool saved = await widget.user.savePhoto(widget.imageFile, _itemName, _price,
                                _comments, widget.restaurant); // save contents
                              if (saved) {
                                Navigator.pop(context, saved);
                              }
                            }
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}
