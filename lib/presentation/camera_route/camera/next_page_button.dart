import 'package:flutter/material.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/camera_route/restaurants/select_restaurant_page.dart';
import 'package:foodprint/presentation/core/animations/transitions.dart';
import 'package:foodprint/presentation/inherited_widgets/inherited_image.dart';
import 'package:foodprint/presentation/inherited_widgets/inherited_location.dart';
import 'package:foodprint/presentation/inherited_widgets/inherited_user.dart';

/// The button that brings the user to the restaurant selection page.
///
/// Passes the list of [restaurants] to the next page.
class NextPageButton extends StatelessWidget {
  const NextPageButton({
    Key key,
    @required this.restaurants,
  }) : super(key: key);

  final List<RestaurantEntity> restaurants;

  @override
  Widget build(BuildContext context) {
    final latitude = InheritedLocation.of(context).latitude;
    final longitude = InheritedLocation.of(context).longitude;
    final token = InheritedUser.of(context).token;
    final oldFoodprint = InheritedUser.of(context).foodprint;
    final imageFile = InheritedImage.of(context).imageFile;

    return Container(
      width: 60,
      height: 60,
      child: Material(
          type: MaterialType.transparency,
          child: Ink(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(1000.0),
              onTap: () {
                // Move to "choose your restaurant" page
                Navigator.of(context).push(SlideLeftRoute(
                    newPage: MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: context.bloc<PhotoActionsBloc>()),
                    BlocProvider.value(value: context.bloc<FoodprintBloc>())
                  ],
                  child: SelectRestaurantPage(
                      latitude: latitude,
                      longitude: longitude,
                      currentFoodprint: oldFoodprint,
                      token: token,
                      imageFile: imageFile,
                      restaurants: restaurants),
                )));
              },
              child: const Icon(
                Icons.navigate_next,
                size: 50.0,
                color: Colors.white,
              ),
            ),
          )),
    );
  }
}
