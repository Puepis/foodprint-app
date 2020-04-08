
import 'package:flutter/material.dart';
import 'package:foodprint/auth/tokens.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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

  Future<http.Response> attemptSignUp(String email, String username, String password) async {
    var res = await http.post(
        '$SERVER_IP/api/users/register',
        body: {
          "email": email,
          "username": username,
          "password": password
        }
    );
    return res;
  }

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
              var email = _emailController.text.trim();
              var username = _usernameController.text.trim();
              var password = _passwordController.text.trim();
              var res = await attemptSignUp(email, username, password);
              if (res.statusCode == 201) {
                // Redirect to login page
                Navigator.pop(context);
                displayDialog(context, "Success", "Registration successful. You can log in now.");
              }
              else if (res.statusCode == 409) {
                displayDialog(context, "That email is already registered",
                    "Please sign up using a different email or log in if you already have an account.");
              }
              else if (res.statusCode == 400) {
                displayDialog(context, "Errors Found", res.body);
              }
              else {
                displayDialog(context, "Error", res.body);
              }
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
