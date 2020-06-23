import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/auth/login_form/login_form_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginFormBloc, LoginFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () {
            // Nothing happened yet
          },
          (either) => either.fold((failure) {
            FlushbarHelper.createError(
              message: failure.map(
                serverError: (_) => 'Server error',
                invalidLoginCombination: (_) => 'Invalid login combination', 
              ),).show(context);
            }, 
            (jwt) {
              // TODO: Navigate to dashboard
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
                                  'Username must not be more than 20 characters',
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
              if (state.isSubmitting) ...[
                const SizedBox(height: 8),
                const LinearProgressIndicator()
              ]
            ],
          ),
        );
      },
    );
  }
}
