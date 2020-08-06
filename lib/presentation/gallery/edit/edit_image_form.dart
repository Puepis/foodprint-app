import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodprint/application/auth/auth_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';

/// The form used to edit the details of [photo]
class EditImageForm extends StatefulWidget {
  final JWT token;
  final PhotoEntity photo;
  final FoodprintEntity foodprint;
  final RestaurantEntity restaurant;
  const EditImageForm(
      {Key key,
      @required this.token,
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
  bool _isFavourite;

  final TextStyle _sectionTitleStyle = const TextStyle(
      color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18.0);

  final SizedBox _sectionHeadingSpace = const SizedBox(
    height: 10.0,
  );

  final SizedBox _sectionSpace = const SizedBox(
    height: 10.0,
  );

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
  void didChangeDependencies() {
    super.didChangeDependencies();
    _isFavourite = widget.photo.isFavourite;
  }

  @override
  Widget build(BuildContext context) {
    final PhotoActionsBloc photoBloc = context.bloc<PhotoActionsBloc>();

    return BlocConsumer<PhotoActionsBloc, PhotoActionsState>(
        listener: (context, state) {
      if (state is EditFailure) {
        Scaffold.of(context)..hideCurrentSnackBar();
        FlushbarHelper.createError(
          message: state.failure.map(
              invalidPhoto: (_) => 'Invalid Photo',
              serverError: (_) => 'Server Error',
              noInternet: (_) => 'No internet connection'),
        ).show(context);
      }
      if (state is EditSuccess) {
        // Refresh the app
        context.bloc<AuthBloc>().add(AuthEvent.loggedIn(token: widget.token));
      }
    }, builder: (context, state) {
      return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isFavourite = !_isFavourite;
                        });
                      },
                      child: Icon(
                        _isFavourite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "Favourite",
                      style: _sectionTitleStyle,
                    ),
                  ],
                )),
            const SizedBox(
              height: 30,
            ),
            _buildSectionTitle(
                title: "Item Name", iconData: Icons.restaurant_menu),
            _sectionHeadingSpace,
            TextFormField(
              initialValue: widget.photo.details.name.getOrCrash(),
              cursorColor: primaryColor,
              maxLength: 50,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.0)),
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
              initialValue: widget.photo.details.price.getOrCrash().toString(),
              cursorColor: primaryColor,
              maxLength: 8,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
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
            _sectionSpace,
            _buildSectionTitle(
                title: "Comments",
                iconData: Icons.rate_review,
                iconColor: foodprintPrimaryColorSwatch[600]),
            _sectionHeadingSpace,
            TextFormField(
                initialValue: widget.photo.details.comments.getOrCrash(),
                cursorColor: primaryColor,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                maxLength: 200,
                decoration: InputDecoration(
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
                      'UPDATE',
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
                              _formKey.currentState.save();

                              // Edit photo
                              photoBloc.add(PhotoActionsEvent.edited(
                                oldPhoto: widget.photo,
                                newName: _itemName,
                                newPrice: _price,
                                newComments: _comments,
                                isFavourite: _isFavourite,
                              ));
                            }
                          }),
              ),
            )
          ],
        ),
      );
    });
  }
}
