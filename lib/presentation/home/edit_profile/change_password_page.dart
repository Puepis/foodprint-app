import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/account/account_bloc.dart';
import 'package:foodprint/application/auth/auth_bloc.dart';
import 'package:foodprint/presentation/common/buttons.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/data/user_data.dart';

class ChangePasswordPage extends StatefulWidget {
  final UserData userData;
  static const routeName = "change_password/";
  const ChangePasswordPage({Key key, @required this.userData})
      : super(key: key);

  static const _sectionTitleStyle = TextStyle(
      color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16.0);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  String oldPassword, newPassword, confirmPassword;
  bool _showOldPassword = false;
  bool _showNewPassword = false;
  bool _showConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    final token = widget.userData.token;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Change Password"),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: BlocListener<AccountBloc, AccountState>(
          listener: (context, state) {
            if (state is PasswordChangeError) {
              Scaffold.of(context)..hideCurrentSnackBar();
              FlushbarHelper.createError(
                message: state.failure.maybeMap(
                    wrongPassword: (_) => 'Wrong password',
                    serverError: (_) => 'Server Error',
                    noInternet: (_) => 'No Internet Connection',
                    orElse: () => 'Unexpected error'),
              ).show(context);
            }

            if (state is PasswordChangeSuccess) {
              context.bloc<AuthBloc>().add(const AuthEvent.loggedOut());
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  const Text(
                    "Old Password",
                    style: ChangePasswordPage._sectionTitleStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: !_showOldPassword,
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _showOldPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: primaryColorDark,
                        ),
                        onPressed: () => setState(() {
                          _showOldPassword = !_showOldPassword;
                        }),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0)),
                    ),
                    onSaved: (value) => oldPassword = value,
                    validator: (value) {
                      if (value.length < 6 || value.length > 32) {
                        return 'Invalid password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "New Password",
                    style: ChangePasswordPage._sectionTitleStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: !_showNewPassword,
                    enableInteractiveSelection: false,
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _showNewPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: primaryColorDark,
                        ),
                        onPressed: () => setState(() {
                          _showNewPassword = !_showNewPassword;
                        }),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0)),
                    ),
                    onChanged: (value) => newPassword = value,
                    onSaved: (value) => newPassword = value,
                    validator: (value) {
                      if (value.length < 6) {
                        return 'Please enter a longer password';
                      } else if (value.length > 32) {
                        return 'Password must not be longer than 32 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Confirm Password",
                    style: ChangePasswordPage._sectionTitleStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: !_showConfirmPassword,
                    enableInteractiveSelection: false,
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _showConfirmPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: primaryColorDark,
                        ),
                        onPressed: () => setState(() {
                          _showConfirmPassword = !_showConfirmPassword;
                        }),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0)),
                    ),
                    onSaved: (value) => confirmPassword = value,
                    validator: (value) {
                      if (value == newPassword) {
                        return null;
                      }
                      return 'Passwords must match';
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  AuthIdleButton(
                    title: "Save and Relog",
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();

                        context.bloc<AccountBloc>().add(
                            AccountEvent.passwordChanged(
                                accessToken: token,
                                oldPassword: oldPassword,
                                newPassword: newPassword));
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
