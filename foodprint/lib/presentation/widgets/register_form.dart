import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/auth/register_form/register_form_bloc.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterFormBloc, RegisterFormState>(
        listener: (context, state) {
          state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold((failure) {
            FlushbarHelper.createError(
              message: failure.map(
                serverError: (_) => 'Server error',
                emailAlreadyInUse: (_) => 'Email already in use',
                usernameAlreadyInUse: (_) => 'Username already in use',
                invalidRegisterCombination: (_) => 'Invalid register combination' ,
              ),).show(context);
            }, (_) {
              // TODO: Navigate
            }
          )
        );
        },
        builder: (context, state) {
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
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Username",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0))),
                  onChanged: (value) => context.bloc<RegisterFormBloc>().add(
                      RegisterFormEvent.usernameChanged(
                          value)), // fire an event
                  validator: (_) => context
                      .bloc<RegisterFormBloc>()
                      .state
                      .emailAddress
                      .value
                      .fold(
                          (f) => f.maybeMap(
                              invalidEmail: (_) => 'Invalid Email',
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
                        RegisterFormEvent.passwordChanged(
                            value)), // fire an event
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
                    color: Colors.orange,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                    onPressed: () {
                      context
                          .bloc<RegisterFormBloc>()
                          .add(const RegisterFormEvent.registerPressed());
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
