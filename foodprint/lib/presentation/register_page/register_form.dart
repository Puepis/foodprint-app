import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/auth/register_form/register_form_bloc.dart';
import 'package:foodprint/presentation/core/animations/transitions.dart';
import 'package:foodprint/presentation/core/styles/text_styles.dart';
import 'package:foodprint/presentation/login_page/login_page.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterFormBloc, RegisterFormState>(
        listener: (context, state) {
      if (state.isSubmitting) {
        Scaffold.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Registering...'),
                  CircularProgressIndicator(),
                ],
              ),
            ),
          );
      }
      state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold((failure) {
                Scaffold.of(context)..hideCurrentSnackBar();
                FlushbarHelper.createError(
                  message: failure.map(
                    serverError: (_) => 'Server error',
                    userAlreadyExists: (_) =>
                        'Email or username already in use',
                    invalidRegisterCombination: (_) =>
                        'Invalid register combination',
                  ),
                ).show(context);
              }, (success) {
                Navigator.push(
                    context,
                    SlideLeftRoute(
                       newPage: const LoginPage()));
              }));
    }, builder: (context, state) {
      return Form(
        autovalidate: state.showErrorMessages,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.0)),
              ),
              onChanged: (value) => context
                  .bloc<RegisterFormBloc>()
                  .add(RegisterFormEvent.emailChanged(value)), // fire an event
              validator: (_) => context
                  .bloc<RegisterFormBloc>()
                  .state
                  .emailAddress
                  .value
                  .fold(
                      (f) => f.maybeMap(
                          invalidEmail: (_) => 'Invalid email',
                          orElse: () => null),
                      (r) => null),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0))),
              onChanged: (value) => context.bloc<RegisterFormBloc>().add(
                  RegisterFormEvent.usernameChanged(value)), // fire an event
              validator: (_) => context
                  .bloc<RegisterFormBloc>()
                  .state
                  .username
                  .value
                  .fold(
                      (f) => f.maybeMap(
                          exceedingLength: (_) =>
                              'Username must not be more than 20 characters',
                          orElse: () => null),
                      (r) => null),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0)),
                ),
                onChanged: (value) => context.bloc<RegisterFormBloc>().add(
                    RegisterFormEvent.passwordChanged(value)), // fire an event
                validator: (_) => context
                    .bloc<RegisterFormBloc>()
                    .state
                    .password
                    .value
                    .fold(
                        (f) => f.maybeMap(
                            shortPassword: (_) => 'Short Password',
                            orElse: () => null),
                        (r) => null)),
            const SizedBox(height: 30),
            ButtonTheme(
                height: 50,
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
                  ),
                  onPressed: () {
                    context
                        .bloc<RegisterFormBloc>()
                        .add(const RegisterFormEvent.registerPressed());
                  },
                  child: Text('Register', style: buttonText),
                ))
          ],
        ),
      );
    });
  }
}
