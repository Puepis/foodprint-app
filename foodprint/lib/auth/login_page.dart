import 'package:flutter/material.dart';
import 'package:foodprint/auth/tokens.dart';
import 'package:foodprint/home.dart';
import 'package:foodprint/auth/register_page.dart';
import 'package:foodprint/service/auth.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _username, _password;
  final List<Permission> _permissions = [Permission.location, Permission.camera];

  Future<void> _requestPermissions() async {
    for (Permission permission in _permissions) {
      await permission.request();
    }
  }

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            header(),
            loginForm(),
          ],
        ),
      ),
    );
  }

  void handleLoginResponse(BuildContext context, http.Response res) {
    switch (res.statusCode) {
      case 200: { // success
        String token = res.body;
        // TODO: Delete JWT after expiry
        storage.write(
          key: "jwt", value: token); // TODO: don't store token locally
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage.construct(token))
        );
      }
      break;
      case 401: {
          displayDialog(context, "Error", res.body);
      }
      break;
      default: {
          print(res.body);
          displayDialog(context, "Unexpected error", res.body);
      }
    }
  }

  void displayDialog(context, title, text) => showDialog(
    context: context,
    builder: (context) =>
        AlertDialog(
            title: Text(title),
            content: Text(text)
        ),
  );

  ButtonBar buttons() {
    return ButtonBar(
      children: <Widget>[
        RaisedButton(
            elevation: 3.0,
            child: Text('Sign Up Here'),
            shape: BeveledRectangleBorder(
              borderRadius:BorderRadius.all(Radius.circular(7.0)),
            ),
            onPressed:() async {
              Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()
              ));
            }
        ),
        RaisedButton(
            elevation: 8.0,
            child: Text('Log In'),
            shape: BeveledRectangleBorder(
              borderRadius:BorderRadius.all(Radius.circular(7.0)),
            ),
            onPressed:() async {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                _formKey.currentState.reset();
                http.Response res = await AuthService.attemptLogin(_username, _password);
                handleLoginResponse(context, res);
              }
            }
        ),
      ],
    );
  }

  Container header() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Text("Foodprint"),
    );
  }

  Container loginForm() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      margin: EdgeInsets.only(top: 30.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
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
              },
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
}
