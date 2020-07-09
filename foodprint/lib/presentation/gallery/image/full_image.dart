import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/gallery/image/photo_info_sheet.dart';


class FullImage extends StatelessWidget {
  final FoodprintEntity foodprint;
  final RestaurantEntity restaurant;
  final PhotoEntity photo;
  const FullImage({
    Key key,
    @required this.restaurant,
    @required this.photo,
    @required this.foodprint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: GestureDetector(
          onVerticalDragEnd: (details) {
            final double dy = details.velocity.pixelsPerSecond.dy;
            if (dy > 0) {
              // swipe down
              Navigator.pop(context);
            } else if (dy < 0) {
              // swipe up
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (_) => MultiBlocProvider(
                          providers: [
                            BlocProvider.value(
                                value: context.bloc<PhotoActionsBloc>()),
                            BlocProvider.value(
                                value: context.bloc<FoodprintBloc>())
                          ],
                          child: PhotoInfoSheet(
                            photo: photo,
                            restaurant: restaurant,
                            foodprint: foodprint,
                          )));
            }
          },
          child: Center(
            child: Hero(tag: photo.timestamp.getOrCrash(), child: Image.network(photo.url.getOrCrash())),
          ),
        ));
  }
}
