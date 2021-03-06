import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/account/account_bloc.dart';
import 'package:foodprint/application/auth/auth_bloc.dart';
import 'package:foodprint/presentation/common/buttons.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/core/styles/gradients.dart';
import 'package:foodprint/presentation/data/user_data.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:provider/provider.dart';

import 'edit_profile.dart';

/// The page that allows users to edit their profile and delete their account.
class EditProfilePage extends StatefulWidget {
  static const routeName = "edit_profile/";
  final VoidCallback onFinished;
  const EditProfilePage({Key key, @required this.onFinished}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userData = context.watch<UserData>();
    final token = userData.token;
    final username = token.username;
    _usernameController.text = username;

    const TextStyle _fieldTitleStyle = TextStyle(
        color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16.0);

    return Scaffold(
        appBar: GradientAppBar(
          gradient: LinearGradient(
            colors: sweetMorningGradient,
          ),
          centerTitle: true,
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
              widget.onFinished();
              context.bloc<AuthBloc>().add(const AuthEvent.loggedOut());
            }
          },
          child: ListView(
            shrinkWrap: true,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Text("Username", style: _fieldTitleStyle),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(
                      context, ChangeUsernamePage.routeName),
                  child: TextFormField(
                    controller: _usernameController,
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
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 30, right: 20),
                child: Text("Password", style: _fieldTitleStyle),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                child: GestureDetector(
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
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
                child: AuthIdleButton(
                    title: "Sign Out",
                    onPressed: () {
                      widget.onFinished();
                      context.bloc<AuthBloc>().add(const LoggedOut());
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: FlatButton(
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
              ),
            ],
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
