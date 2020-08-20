import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/auth/login_form/login_form_bloc.dart';
import 'package:foodprint/application/auth/auth_bloc.dart';
import 'package:foodprint/presentation/common/buttons.dart';
import 'package:foodprint/presentation/common/text_fields.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';

/// The user login form.
class LoginForm extends StatefulWidget {
  const LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscureText = true;
  bool _isSubmitting = false;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<LoginFormBloc, LoginFormState>(
        // Listening for changes to the login state
        listener: (context, state) {
          if (state.isSubmitting) {
            setState(() {
              _isSubmitting = true;
            });
          }
          state.loginOption.fold(
              () {},
              (either) => either.fold((failure) {
                    setState(() {
                      _isSubmitting = false;
                    });
                    Scaffold.of(context)..hideCurrentSnackBar();
                    FlushbarHelper.createError(
                      message: failure.map(
                        serverError: (_) => 'Server error',
                        noInternet: (_) => 'No Internet Connection',
                        invalidLoginCombination: (_) =>
                            'Invalid login combination',
                      ),
                    ).show(context);
                  }, (accessToken) {
                    setState(() {
                      _isSubmitting = false;
                    });
                    context
                        .bloc<AuthBloc>()
                        .add(AuthEvent.loggedIn(token: accessToken)); // authenticated
                  }));
        },
        builder: (context, state) {
          return Form(
            autovalidate: state.showErrorMessages,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                AuthFormField(
                    labelText: "Username",
                    prefixIconData: Icons.person,
                    onChanged: (value) => context
                        .bloc<LoginFormBloc>()
                        .add(LoginFormEvent.usernameChanged(value)),
                    validator: (_) => context
                        .bloc<LoginFormBloc>()
                        .state
                        .username
                        .value
                        .fold(
                            (f) => f.maybeMap(
                                empty: (_) => 'Username must not be empty',
                                exceedingLength: (_) =>
                                    'Username length exceeded',
                                orElse: () => null),
                            (r) => null)),
                const SizedBox(
                  height: 20,
                ),
                AuthFormField(
                    labelText: "Password",
                    prefixIconData: Icons.lock,
                    visibilityIconButton: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: primaryColorDark,
                        semanticLabel:
                            _obscureText ? "Hide password" : "Show password",
                      ),
                      onPressed: () {
                        _toggle();
                      },
                    ),
                    obscureText: _obscureText,
                    onChanged: (value) => context
                        .bloc<LoginFormBloc>()
                        .add(LoginFormEvent.passwordChanged(value)),
                    validator: (_) => context
                        .bloc<LoginFormBloc>()
                        .state
                        .password
                        .value
                        .fold(
                            (f) => f.maybeMap(
                                passwordTooLong: (_) => 'Password too long',
                                passwordTooShort: (_) => 'Password too short',
                                orElse: () => null),
                            (r) => null)),
                const SizedBox(
                  height: 30.0,
                ),
                if (_isSubmitting)
                  const AuthLoadingButton(title: "Login")
                else
                  AuthIdleButton(
                      title: "Login",
                      onPressed: state.isSubmitting
                          ? null
                          : () {
                              context
                                  .bloc<LoginFormBloc>()
                                  .add(const LoginFormEvent.loginPressed());
                            })
              ],
            ),
          );
        },
      );
}
