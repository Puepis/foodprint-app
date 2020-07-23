import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/account/account_bloc.dart';
import 'package:foodprint/application/auth/auth_bloc.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/presentation/common/buttons.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/home/settings/change_password_page.dart';
import 'package:foodprint/presentation/home/settings/change_username_page.dart';
import 'package:foodprint/presentation/router/update_account_args.dart';

class SettingsPage extends StatelessWidget {
  final JWT token;
  static const String routeName = "/settings";
  const SettingsPage({Key key, @required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final username =
        JWT.getDecodedPayload(token.getOrCrash())['username'] as String;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Settings"),
        ),
        body: BlocListener<AccountBloc, AccountState>(
          listener: (context, state) {
            if (state is DeleteAccountError) {
              Scaffold.of(context)..hideCurrentSnackBar();
              FlushbarHelper.createError(
                message: state.failure.maybeMap(
                    serverError: (_) => 'Server Error',
                    orElse: () => 'Unexpected error'),
              ).show(context);
            }

            if (state is DeleteAccountSuccess) {
              // Log user out
              context.bloc<AuthBloc>().add(const AuthEvent.loggedOut());
            }
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Account",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text("Username",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0)),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onTap: () => Navigator.pushNamed(
                        context, ChangeUsernamePage.routeName,
                        arguments: ChangeUsernameArgs(token)),
                    enabled: true,
                    initialValue: username,
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0)),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text("Password",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0)),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    enabled: true,
                    initialValue: '********',
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0)),
                    ),
                    onTap: () => Navigator.pushNamed(
                        context, ChangePasswordPage.routeName,
                        arguments: ChangePasswordArgs(token)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  AuthIdleButton(
                      title: "Sign Out",
                      onPressed: () =>
                          context.bloc<AuthBloc>().add(const LoggedOut())),
                  const SizedBox(
                    height: 15,
                  ),
                  FlatButton(
                    onPressed: () async {
                      final bool confirmed = await _confirmDeletion(context);
                      if (confirmed) {
                        context
                            .bloc<AccountBloc>()
                            .add(AccountDeleted(token: token));
                      }
                    },
                    child: const Text(
                      "Delete Account",
                      style: TextStyle(color: Colors.grey, fontSize: 14.0),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "version 1.0.0",
                        style: TextStyle(color: Colors.grey, fontSize: 14.0),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Future<bool> _confirmDeletion(BuildContext context) async {
    return (await showDialog(
            context: context,
            builder: (context) => Dialog(
                  backgroundColor: foodprintPrimaryColorSwatch[50],
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
