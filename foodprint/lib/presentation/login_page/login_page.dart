import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/auth/login_form/login_form_bloc.dart';
import 'package:foodprint/injection.dart';
import 'package:foodprint/presentation/login_page/login_form.dart';
import 'package:foodprint/presentation/routes/router.gr.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
              const Text(
                "Welcome back!",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 2.5,
              ),
              const Text(
                "Sign in to continue",
                style: TextStyle(fontSize: 20.0, color: Colors.grey),
              ),
              const SizedBox(
                height: 60.0,
              ),
              BlocProvider(
                create: (context) => getIt<LoginFormBloc>(),
                child: const LoginForm(),
              ),
              const SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
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
                      ExtendedNavigator.of(context).pushReplacementNamed(Routes.registerPage);
                      Navigator.pushNamed(context, "/register");
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                          fontSize: 14.0),
                    ),
                  )
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}


