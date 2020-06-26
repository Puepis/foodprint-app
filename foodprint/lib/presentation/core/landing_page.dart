
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:foodprint/presentation/routes/router.gr.dart';

class LandingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Foodprint",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 60.0
              ),
            ),
            Image.asset(
              'assets/images/logo.png',
              height: 200,
              width: 300,
            ),
            const SizedBox(height: 50,),
            ButtonTheme(
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
                ),
                onPressed: () {
                  ExtendedNavigator.of(context).pushNamed(Routes.loginPage);
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            ButtonTheme(
              height: 50,
              child: OutlineButton(
                borderSide: const BorderSide(
                  width: 1.5,
                ),
                highlightColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () {
                  ExtendedNavigator.of(context).pushNamed(Routes.registerPage);
                },
                child: const Text(
                  "Register",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
