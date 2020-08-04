import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/core/animations/transitions.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/gallery/edit/edit_image_screen.dart';
import 'package:foodprint/presentation/inherited_widgets/inherited_user.dart';
import 'package:intl/intl.dart';
import 'package:foodprint/domain/core/value_transformers.dart';

/// Displays the photo's details
class PhotoInfoSheet extends StatelessWidget {
  const PhotoInfoSheet({
    Key key,
    @required this.photo,
    @required this.restaurant,
  }) : super(key: key);

  final PhotoEntity photo;
  final RestaurantEntity restaurant;

  TextStyle get _sectionTitleStyle => TextStyle(
      color: Colors.grey.shade400,
      fontSize: 12.0,
      fontWeight: FontWeight.normal);

  TextStyle get _sectionBodyStyle => const TextStyle(
      color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.normal);

  SizedBox get _sectionTitleDivider => SizedBox(
        width: 25,
        child: Divider(height: 10, thickness: 1, color: primaryColor),
      );

  SizedBox get _sectionSpace => const SizedBox(
        height: 25,
      );

  @override
  Widget build(BuildContext context) {
    // Currency formatter
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    final JWT token = InheritedUser.of(context).token;
    final FoodprintEntity foodprint = InheritedUser.of(context).foodprint;

    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        color: Color(0xFF1e1c1c),
      ),
      padding: const EdgeInsets.all(20),
      child: Stack(
        children: [
          _buildDetails(context, formatter),
          _buildEditButton(context, token, foodprint)
        ],
      ),
    );
  }

  Widget _buildDetails(BuildContext context, NumberFormat formatter) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
                text: "${photo.details.name.getOrCrash()}\n",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
                children: [
                  TextSpan(
                      text: formatter.format(photo.details.price.getOrCrash()),
                      style: TextStyle(
                          height: 1.5,
                          color: Colors.green.shade500,
                          fontSize: 20))
                ]),
          ),
          const Divider(
            color: Colors.grey,
            height: 30,
            thickness: 1,
          ),
          const SizedBox(
            height: 10,
          ),
          _buildBody(context),
          Align(
            alignment: Alignment.bottomLeft,
            child: Icon(
              photo.isFavourite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
              size: 30,
            ),
          )
        ],
      );

  Expanded _buildBody(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _createSection('COMMENTS', photo.details.comments.getOrCrash()),
          _sectionSpace,
          _createSection('TIMESTAMP', photo.timestamp.toReadable()),
          _sectionSpace,
          Text("LOCATION", style: _sectionTitleStyle),
          _sectionTitleDivider,
          const SizedBox(
            height: 5,
          ),
          Text(restaurant.name.getOrCrash(),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: _sectionBodyStyle),
          const SizedBox(
            height: 5.0,
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Theme.of(context).primaryColor,
                size: 18,
              ),
              const SizedBox(
                width: 7.5,
              ),
              Text(
                restaurant.rating.getOrCrash().toString(),
                style: _sectionBodyStyle,
              )
            ],
          ),
          const SizedBox(
            height: 7.5,
          ),
          Text(
              "${restaurant.latitude.getOrCrash().toStringAsFixed(3)}, ${restaurant.longitude.getOrCrash().toStringAsFixed(3)}",
              style: _sectionBodyStyle.copyWith(fontSize: 12)),
        ],
      ),
    );
  }

  Positioned _buildEditButton(
          BuildContext context, JWT token, FoodprintEntity foodprint) =>
      Positioned(
        top: 5.0,
        right: 5.0,
        child: IconButton(
          icon: const Icon(Icons.edit),
          color: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.of(context).push(SlideUpEnterRoute(
                newPage: MultiBlocProvider(
              providers: [
                BlocProvider.value(value: context.bloc<PhotoActionsBloc>()),
                BlocProvider.value(
                  value: context.bloc<FoodprintBloc>(),
                )
              ],
              child: EditImageScreen(
                token: token,
                restaurant: restaurant,
                foodprint: foodprint,
                photo: photo,
              ),
            )));
          },
        ),
      );

  Widget _createSection(String title, String body) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: _sectionTitleStyle,
          ),
          _sectionTitleDivider,
          const SizedBox(
            height: 5,
          ),
          Text(
            body,
            style: _sectionBodyStyle,
          ),
        ],
      );
}
