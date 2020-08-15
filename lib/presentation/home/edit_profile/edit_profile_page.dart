import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/account/account_bloc.dart';
import 'package:foodprint/application/auth/auth_bloc.dart';
import 'package:foodprint/presentation/common/buttons.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/data/user_data.dart';

import 'edit_profile.dart';

/// The page that allows users to edit their profile and delete their account.
class EditProfilePage extends StatelessWidget {
  final UserData userData;
  static const routeName = "edit_profile/";
  const EditProfilePage({Key key, @required this.userData})
      : assert(userData != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final token = userData.token;
    final username = token.username;

    const TextStyle _fieldTitleStyle = TextStyle(
        color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16.0);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Profile"),
        ),
        body: BlocListener<AccountBloc, AccountState>(
          listener: (context, state) {
            if (state is DeleteAccountError) {
              Scaffold.of(context)..hideCurrentSnackBar();
              FlushbarHelper.createError(
                message: state.failure.maybeMap(
                    serverError: (_) => 'Server Error',
                    noInternet: (_) => 'No Internet Connection',
                    orElse: () => 'Unexpected error'),
              ).show(context);
            }

            if (state is DeleteAccountSuccess) {
              context.bloc<AuthBloc>().add(const AuthEvent.loggedOut());
            }
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: ListView(
              shrinkWrap: true,
              children: [
                const Text("Username", style: _fieldTitleStyle),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                      context, ChangeUsernamePage.routeName),
                  child: TextFormField(
                    initialValue: username,
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                      enabled: false,
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text("Password", style: _fieldTitleStyle),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                      context, ChangePasswordPage.routeName),
                  child: TextFormField(
                    initialValue: '********',
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                      enabled: false,
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                AuthIdleButton(
                    title: "Sign Out",
                    onPressed: () {
                      context.bloc<AuthBloc>().add(const LoggedOut());
                      Navigator.of(context).pop();
                    }),
                const SizedBox(
                  height: 15,
                ),
                FlatButton(
                  onPressed: () async {
                    final bool confirmed = await _confirmDeletion(context);
                    if (confirmed) {
                      context
                          .bloc<AccountBloc>()
                          .add(AccountEvent.accountDeleted(accessToken: token));
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.delete,
                        color: Colors.grey,
                        size: 22,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Delete Account",
                        style: TextStyle(color: Colors.grey, fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  /// Displays a dialog that confirms the user's account deletion
  Future<bool> _confirmDeletion(BuildContext context) async {
    return (await showDialog(
            context: context,
            builder: (context) => Dialog(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Container(
                    height: 175,
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "ARE YOU SURE?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Expanded(
                          child: Text(
                            "Deleting your account will \n remove all of your photos.",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.0),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FlatButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Icon(
                                Icons.close,
                                size: 30,
                              ),
                            ),
                            FlatButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Icon(
                                Icons.delete_forever,
                                color: Colors.red,
                                size: 30,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ))) ??
        false;
  }
}
