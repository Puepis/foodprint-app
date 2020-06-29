import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/auth/register_form/register_form_bloc.dart';
import 'package:foodprint/injection.dart';
import 'package:foodprint/presentation/core/styles/text_styles.dart';
import 'package:foodprint/presentation/register_page/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.fromLTRB(25, 70, 25, 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 75,
              width: 75,
            ),
            Text(
              "Create an account",
              style: title1,  
            ),
            const SizedBox(
              height: 2.5,
            ),
            const Text(
              "to begin tracking your foodprint",
              style: TextStyle(fontSize: 20.0, color: Colors.grey),
            ),
            const SizedBox(
              height: 60.0,
            ),
            BlocProvider(
              create: (context) => getIt<RegisterFormBloc>(),
              child: const RegisterForm(),
            ),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 4.0,
                ),
                InkWell(
                  onTap: () {
                    ExtendedNavigator.of(context).pop();
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 14.0),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
