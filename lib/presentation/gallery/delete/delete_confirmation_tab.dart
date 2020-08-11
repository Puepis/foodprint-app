import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/data/user_data.dart';
import 'package:provider/provider.dart';

/// The dialog that shows to confirm the deletion of [photo]
class DeleteConfirmationTab extends StatelessWidget {
  const DeleteConfirmationTab({
    Key key,
    @required this.photo,
    @required this.restaurant,
  }) : super(key: key);

  final PhotoEntity photo;
  final RestaurantEntity restaurant;

  @override
  Widget build(BuildContext context) {
    final PhotoActionsBloc photoBloc = context.bloc<PhotoActionsBloc>();

    return BlocListener<PhotoActionsBloc, PhotoActionsState>(
      listener: (context, state) {
        if (state is DeleteSuccess) {
          context.read<UserData>().deletePhoto(restaurant, photo);
          Navigator.pop(context);
        }
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: Wrap(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 5.0),
              child: const Text(
                "Are you sure you want to delete this photo?",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14.0, color: Colors.white70),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.delete_outline,
                color: Colors.white70,
              ),
              title: const Text(
                "Delete photo",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Delete photo
                photoBloc.add(PhotoActionsEvent.deleted(
                  photo: photo,
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}
