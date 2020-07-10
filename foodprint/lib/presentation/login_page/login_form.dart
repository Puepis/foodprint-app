import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/auth/login_form/login_form_bloc.dart';
import 'package:foodprint/application/auth/auth_bloc.dart';
import 'package:foodprint/presentation/core/styles/text_styles.dart';

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
  Widget build(BuildContext context) {
    return BlocConsumer<LoginFormBloc, LoginFormState>(
      // Listening for changes to the login state
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
                      invalidLoginCombination: (_) =>
                          'Invalid login combination',
                    ),
                  ).show(context);
                }, (jwt) {
                  setState(() {
                    _isSubmitting = false;
                  });
                  context
                      .bloc<AuthBloc>()
                      .add(AuthEvent.loggedIn(token: jwt)); // authenticated
                }));
      },
      builder: (context, state) {
        return Form(
          autovalidate: state.showErrorMessages,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.0)),
                  ),
                  onChanged: (value) => context.bloc<LoginFormBloc>().add(
                      LoginFormEvent.usernameChanged(value)), // fire an event
                  validator: (_) => context
                      .bloc<LoginFormBloc>()
                      .state
                      .username
                      .value
                      .fold(
                          (f) => f.maybeMap(
                              exceedingLength: (_) =>
                                  'Username length exceeded',
                              orElse: () => null),
                          (r) => null)),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  autocorrect: false,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          semanticLabel:
                              _obscureText ? "Hide password" : "Show password",
                        ),
                        onPressed: () {
                          _toggle();
                        },
                      ),
                      hintText: '********',
                      labelText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0))),
                  obscureText: _obscureText,
                  onChanged: (value) => context.bloc<LoginFormBloc>().add(
                      LoginFormEvent.passwordChanged(value)), // fire an event
                  validator: (_) => context
                      .bloc<LoginFormBloc>()
                      .state
                      .password
                      .value
                      .fold(
                          (f) => f.maybeMap(
                              shortPassword: (_) => 'Short Password',
                              orElse: () => null),
                          (r) => null)),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {},
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              if (_isSubmitting)
                ButtonTheme(
                  height: 50,
                  child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                      onPressed: () => null,
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Login', style: buttonText),
                            ],
                          ),
                          const SizedBox(
                            height: 21,
                            width: 21,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white),
                            ),
                          ),
                        ],
                      )),
                )
              else
                ButtonTheme(
                  height: 50,
                  child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                      onPressed: () {
                        context
                            .bloc<LoginFormBloc>()
                            .add(const LoginFormEvent.loginPressed());
                      },
                      child: Text('Login', style: buttonText)),
                ),
            ],
          ),
        );
      },
    );
  }
}
