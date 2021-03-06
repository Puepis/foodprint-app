import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/presentation/data/gallery_photo.dart';
import 'package:provider/provider.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/gallery/edit/edit_image_page.dart';
import 'package:foodprint/presentation/data/user_data.dart';
import 'package:intl/intl.dart';
import 'package:foodprint/domain/core/value_transformers.dart';

/// Displays the photo's details
class PhotoInfoSheet extends StatefulWidget {
  const PhotoInfoSheet({
    Key key,
  }) : super(key: key);

  @override
  _PhotoInfoSheetState createState() => _PhotoInfoSheetState();
}

class _PhotoInfoSheetState extends State<PhotoInfoSheet> {
  bool _isFavourite;

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
  void didChangeDependencies() {
    super.didChangeDependencies();
    final photo = context.read<GalleryPhotoModel>().photo;
    _isFavourite = photo.isFavourite;
  }

  @override
  Widget build(BuildContext context) {
    // Currency formatter
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    final userData = context.watch<UserData>();

    final galleryPhoto = context.watch<GalleryPhotoModel>();
    final photo = galleryPhoto.photo;
    final restaurant = galleryPhoto.restaurant;

    return Container(
      height: MediaQuery.of(context).size.height * 0.66,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        color: Color(0xFF1e1c1c),
      ),
      child: LayoutBuilder(
          builder: (_, constraints) => Stack(
                children: [
                  BlocListener<PhotoActionsBloc, PhotoActionsState>(
                      listener: (context, state) {
                        if (state is ChangeFavouriteFailure) {
                          FlushbarHelper.createError(
                              message: state.failure.maybeMap(
                                  noInternet: (_) => 'No internet connection',
                                  orElse: () => 'Server error')).show(context);
                        }

                        if (state is ChangeFavouriteSuccess) {
                          final newPhoto =
                              photo.copyWith(isFavourite: state.isFavourite);
                          userData.updatePhoto(restaurant, newPhoto);
                          galleryPhoto.updatePhoto(newPhoto);
                        }
                      },
                      child: Column(
                        children: [
                          _buildSwipeIndicator(constraints),
                          _buildDetails(formatter, constraints, userData, photo,
                              restaurant),
                        ],
                      )),
                  _buildEditButton(userData)
                ],
              )),
    );
  }

  Container _buildSwipeIndicator(BoxConstraints constraints) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))),
      child: Center(
        child: SizedBox(
          width: constraints.maxWidth * 0.06,
          child: const Divider(
            color: Colors.grey,
            thickness: 3,
            height: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildDetails(NumberFormat formatter, BoxConstraints constraints,
          UserData userData, PhotoEntity photo, RestaurantEntity restaurant) =>
      Expanded(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: constraints.maxWidth * 0.2),
                child: Text(photo.details.name.getOrCrash(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22)),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(formatter.format(photo.details.price.getOrCrash()),
                  style: TextStyle(color: Colors.green.shade500, fontSize: 20)),
              const Divider(
                color: Colors.grey,
                height: 30,
                thickness: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              _buildDetailsBody(photo, restaurant),
              Align(
                alignment: Alignment.bottomLeft,
                child: InkWell(
                  onTap: () {
                    setState(() => _isFavourite = !_isFavourite);
                    context.bloc<PhotoActionsBloc>().add(FavouriteChanged(
                        photo: photo,
                        newFavourite: _isFavourite,
                        accessToken: userData.token));
                  },
                  child: Icon(
                    _isFavourite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                    size: 30,
                  ),
                ),
              )
            ],
          ),
        ),
      );

  Expanded _buildDetailsBody(PhotoEntity photo, RestaurantEntity restaurant) {
    final comments = photo.details.comments.getOrCrash();
    final timestamp = photo.timestamp.toReadable();
    final latitude = restaurant.latitude.getOrCrash().toStringAsFixed(3);
    final longitude = restaurant.longitude.getOrCrash().toStringAsFixed(3);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (comments.isNotEmpty) _createSection('COMMENTS', comments),
          _createSection('TIMESTAMP', timestamp),
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
          Text("$latitude, $longitude",
              style: _sectionBodyStyle.copyWith(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildEditButton(UserData userData) => Positioned(
        top: 25.0,
        right: 15.0,
        child: IconButton(
          icon: const Icon(Icons.edit),
          color: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.of(context).pushNamed(EditImagePage.routeName);
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
          _sectionSpace,
        ],
      );
}
