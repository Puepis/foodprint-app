import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:foodprint/application/account/account_bloc.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/data/user_data.dart';
import 'package:image_picker/image_picker.dart';
import 'package:transparent_image/transparent_image.dart';

/// Displays the user's avatar and username.
///
/// Here the user can edit their avatar either by taking a picture or selecting
/// from their device's gallery.
class UserSection extends StatefulWidget {
  final UserData userData;
  final VoidCallback onAvatarChange;
  const UserSection(
      {Key key, @required this.userData, @required this.onAvatarChange})
      : super(key: key);

  @override
  _UserSectionState createState() => _UserSectionState();
}

class _UserSectionState extends State<UserSection> {
  @override
  Widget build(BuildContext context) {
    final username = widget.userData.token.username;
    final url = widget.userData.token.avatar_url;

    return BlocListener<AccountBloc, AccountState>(
      listener: (context, state) {
        if (state is AvatarChangeError) {
          Scaffold.of(context)..hideCurrentSnackBar();
          FlushbarHelper.createError(
            message: state.failure.maybeMap(
                serverError: (_) => 'Server Error',
                noInternet: (_) => 'No Internet Connection',
                orElse: () => 'Unexpected error'),
          ).show(context);
        }

        if (state is AvatarChangeLoading) {
          Scaffold.of(context)..hideCurrentSnackBar();
          FlushbarHelper.createInformation(
            message: 'Saving changes...',
          ).show(context);
        }

        if (state is AvatarChangeSuccess) {
          widget.userData.updateToken(state.token);
          widget.onAvatarChange();
        }
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            _buildAvatar(url),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: const TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Displays the user's avatar
  ///
  /// The url is stored in the user's JWT and can be null
  Widget _buildAvatar(String url) => Stack(
        children: [
          Padding(
            padding: EdgeInsets.zero,
            child: (url == null)
                ? Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        color: foodprintPrimaryColorSwatch[50],
                        borderRadius: BorderRadius.circular(100)),
                    child: const Icon(
                      Icons.person_outline,
                      size: 100,
                    ),
                  )
                : Container(
                    height: 120,
                    width: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          fadeInDuration: const Duration(milliseconds: 150),
                          placeholder: (context, url) =>
                              Image.memory(kTransparentImage),
                          imageUrl: url),
                    ),
                  ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
                decoration: BoxDecoration(
                    color: foodprintPrimaryColorSwatch[100],
                    borderRadius: BorderRadius.circular(50)),
                child: InkWell(
                  onTap: _onEditAvatar,
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Icon(
                      Icons.edit,
                      size: 20.0,
                    ),
                  ),
                )),
          ),
        ],
      );

  Future<void> _onEditAvatar() async {
    final result = await showDialog(
        context: context,
        builder: (context) => Dialog(
              backgroundColor: foodprintPrimaryColorSwatch[50],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text("Take photo"),
                    onTap: () => Navigator.of(context).pop(0),
                  ),
                  ListTile(
                    title: const Text("Upload from device"),
                    onTap: () => Navigator.of(context).pop(1),
                  )
                ],
              ),
            ));

    if (result != null) {
      // Get new avatar
      final _picker = ImagePicker();
      final ImageSource source =
          (result == 0) ? ImageSource.camera : ImageSource.gallery;

      PickedFile image;
      try {
        image = await _picker.getImage(source: source, imageQuality: 70);
      } on PlatformException catch (e) {
        Scaffold.of(context)..hideCurrentSnackBar();
        FlushbarHelper.createError(
                message: e.code.contains('camera')
                    ? 'Camera permission required'
                    : 'Gallery permission required')
            .show(context);
        return;
      }

      // Image selected
      if (image != null) {
        final File _imageFile = File(image.path);

        context.bloc<AccountBloc>().add(AccountEvent.avatarChanged(
            newAvatarFile: _imageFile, accessToken: widget.userData.token));
      }
    }
  }
}
