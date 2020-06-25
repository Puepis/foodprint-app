import 'package:auto_route/auto_route.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/auth/login_form/login_form_bloc.dart';
import 'package:foodprint/application/auth/auth_bloc.dart';
import 'package:foodprint/presentation/routes/router.gr.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginFormBloc, LoginFormState>(
      listener: (context, state) {
        if (state.isSubmitting) {
           Scaffold.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Logging in...'),
                  CircularProgressIndicator(),
                ],
              ),
            ),
          );
        }
        state.authFailureOrSuccessOption.fold(
            () {}, // loading
            (either) => either.fold((failure) {
              Scaffold.of(context)..hideCurrentSnackBar();
                  FlushbarHelper.createError(
                    message: failure.map(
                      serverError: (_) => 'Server error',
                      invalidLoginCombination: (_) =>
                          'Invalid login combination',
                    ),
                  ).show(context);
                }, (jwt) {
                  context
                      .bloc<AuthBloc>()
                      .add(AuthEvent.loggedIn(token: jwt)); // authenticated
                  ExtendedNavigator.of(context).pushNamed(Routes.homeScreen,
                      arguments: HomeScreenArguments(token: jwt));
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
                      labelText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0))),
                  obscureText: true,
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
              ButtonTheme(
                height: 50,
                child: RaisedButton(
                  color: Colors.orange,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                  onPressed: () {
                    context
                        .bloc<LoginFormBloc>()
                        .add(const LoginFormEvent.loginPressed());
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
