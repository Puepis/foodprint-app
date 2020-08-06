import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/auth/register_form/register_form_bloc.dart';
import 'package:foodprint/presentation/common/buttons.dart';
import 'package:foodprint/presentation/common/text_fields.dart';
import 'package:foodprint/presentation/login_page/login_page.dart';

/// The user registration form.
class RegisterForm extends StatefulWidget {
  const RegisterForm({Key key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _isSubmitting = false;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterFormBloc, RegisterFormState>(
        listener: (context, state) {
      if (state.isSubmitting) {
        setState(() {
          _isSubmitting = true;
        });
      }
      state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold((failure) {
                setState(() {
                  _isSubmitting = false;
                });
                Scaffold.of(context)..hideCurrentSnackBar();
                FlushbarHelper.createError(
                  message: failure.map(
                    serverError: (_) => 'Server error',
                    userAlreadyExists: (_) =>
                        'Email or username already in use',
                    noInternet: (_) => 'No Internet Connection',
                    invalidRegisterCombination: (_) =>
                        'Invalid register combination',
                  ),
                ).show(context);
              }, (success) {
                Navigator.pushNamed(context, LoginPage.routeOnRegisterSuccess);
              }));
    }, builder: (context, state) {
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
                    .bloc<RegisterFormBloc>()
                    .add(RegisterFormEvent.usernameChanged(value)),
                validator: (_) => context
                    .bloc<RegisterFormBloc>()
                    .state
                    .username
                    .value
                    .fold(
                        (f) => f.maybeMap(
                            empty: (_) => 'Username must not be empty',
                            exceedingLength: (_) =>
                                'Username must not be more than 20 characters',
                            orElse: () => null),
                        (r) => null)),
            const SizedBox(
              height: 20,
            ),
            AuthFormField(
                labelText: "Password",
                prefixIconData: Icons.lock,
                obscureText: _obscureText,
                onChanged: (value) => context
                    .bloc<RegisterFormBloc>()
                    .add(RegisterFormEvent.passwordChanged(value)),
                validator: (_) => context
                    .bloc<RegisterFormBloc>()
                    .state
                    .password
                    .value
                    .fold(
                        (f) => f.maybeMap(
                            passwordTooLong: (_) =>
                                'Password must be not be longer than 32 characters',
                            passwordTooShort: (_) =>
                                'Password must be at least 6 characters',
                            orElse: () => null),
                        (r) => null)),
            const SizedBox(
              height: 20,
            ),
            AuthFormField(
                labelText: "Confirm Password",
                prefixIconData: Icons.lock_outline,
                obscureText: _obscureText,
                onChanged: (value) => context
                    .bloc<RegisterFormBloc>()
                    .add(RegisterFormEvent.confirmationPasswordChanged(value)),
                validator: (_) {
                  return context.bloc<RegisterFormBloc>().state.passwordsMatch
                      ? null
                      : 'Passwords must match';
                }),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Show password"),
                      const SizedBox(
                        width: 5.0,
                      ),
                      SizedBox(
                        height: 25.0,
                        width: 25.0,
                        child: Checkbox(
                          value: !_obscureText,
                          onChanged: (bool newValue) {
                            setState(() {
                              _obscureText = !newValue;
                            });
                          },
                        ),
                      ),
                    ],
                  )),
            ),
            if (_isSubmitting)
              const AuthLoadingButton(title: "Register")
            else
              AuthIdleButton(
                  title: "Register",
                  onPressed: state.isSubmitting
                      ? null
                      : () {
                          context
                              .bloc<RegisterFormBloc>()
                              .add(const RegisterFormEvent.registerPressed());
                        })
          ],
        ),
      );
    });
  }
}
