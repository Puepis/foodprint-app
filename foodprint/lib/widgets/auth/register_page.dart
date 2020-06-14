import 'package:flutter/material.dart';
import 'package:foodprint/service/authentication.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  static const routeName = "/register";
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String _email, _username, _password;

  void handleRegisterResponse(BuildContext context, http.Response res) {
    switch(res.statusCode) {
      case 200: {
        Navigator.pop(context); // login page
        displayDialog(context, "Success", "Registration successful! You can log in now.");
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            header(),
            registerForm(),
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

  Container header() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Text("Register New Account"),
    );
  }

  Container registerForm() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      margin: EdgeInsets.only(top: 30.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Email"
              ),
              onSaved: (String value) {
                _email = value.trim();
              },
              validator: (String value) {
                RegExp re = new RegExp(r"\S+@\S+\.\S+"); // matches anystring@anystring.anystring
                if (value.isEmpty) {
                  return 'Please enter an email';
                }
                else if (!re.hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                else {
                  return null; // valid
                }
              }
            ),
            SizedBox(height: 12.0),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Username"
              ),
              onSaved: (String value) {
                _username = value.trim();
              },
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Please enter a username';
                }
                else if (value.length > 20) {
                  return 'Username must not be longer than 20 characters';
                }
                else {
                  return null;
                }
              }
            ),
            SizedBox(height: 12.0),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Password"
              ),
              onSaved: (String value) {
                _password = value.trim();
              },
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Please enter a password';
                }
                else if (value.length > 20) {
                  return 'Password must not be longer than 20 characters';
                }
                else {
                  return null;
                }
              },
              obscureText: true,
            ),
            buttons()
          ],
        ),
      ),
    );
  }

  ButtonBar buttons() {
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
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                _formKey.currentState.reset();
                http.Response res = await AuthenticationService.attemptSignUp(_email, _username, _password);
                handleRegisterResponse(context, res);
              }
            }
        )
      ],
    );
  }
}
