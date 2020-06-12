
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodprint/service/auth.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void handleRegisterResponse(BuildContext context, http.Response res) {
    switch(res.statusCode) {
      case 200: {
        Navigator.pop(context); // login page
        displayDialog(context, "Success", "Registration successful! You can log in now.");
      }
      break;
      case 400: {
        List errors = jsonDecode(res.body)['errors']; //
        displayDialog(context, "Errors Found", errors);
      }
      break;
      case 409: {
        displayDialog(context, "Email already registered",
          "Please sign up using a different email or log in if you already have an account");
      }
      break;
      default: {
        print(res.body);
        displayDialog(context, "Error", "An unexpected error occurred");
      }
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    _passwordController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            headerSection(),
            infoSection(),
            buttonSection(context)
          ],
        ),
      ),
    );
  }

  void displayDialog(context, title, text) => showDialog(
    context: context,
    builder: (context) =>
        AlertDialog(
            title: Text(title),
            content: Text(text)
        ),
  );

  ButtonBar buttonSection(BuildContext context) {
    return ButtonBar(
      children: <Widget>[
        RaisedButton(
            elevation: 3.0,
            child: Text('Back to Login Page'),
            shape: BeveledRectangleBorder(
              borderRadius:BorderRadius.all(Radius.circular(7.0)),
            ),
            onPressed:() async {
              Navigator.pop(context);
            }
        ),
        RaisedButton(
            elevation: 8.0,
            child: Text('Sign Up!'),
            shape: BeveledRectangleBorder(
              borderRadius:BorderRadius.all(Radius.circular(7.0)),
            ),
            onPressed:() async {
              String email = _emailController.text.trim();
              String username = _usernameController.text.trim();
              String password = _passwordController.text.trim();
              http.Response res = await AuthService.attemptSignUp(email, username, password);
              handleRegisterResponse(context, res);
            }
        )
      ],
    );
  }

  Container infoSection() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      margin: EdgeInsets.only(top: 30.0),
      child: Column(
        children: <Widget>[
          emailField("Email"),
          SizedBox(height: 12.0),
          usernameField("Username"),
          SizedBox(height: 12.0),
          passwordField("Password")
        ],
      ),
    );
  }

  TextFormField emailField(String title) {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(
          labelText:title
      ),
    );
  }

  TextFormField usernameField(String title) {
    return TextFormField(
      controller: _usernameController,
      decoration: InputDecoration(
          labelText:title
      ),
    );
  }

  TextFormField passwordField(String title) {
    return TextFormField(
      controller: _passwordController,
      decoration: InputDecoration(
          labelText:title
      ),
      obscureText: true,
    );
  }

  Container headerSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Text("Register New Account"),
    );
  }
}
