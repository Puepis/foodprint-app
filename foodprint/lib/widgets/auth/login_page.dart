import 'package:flutter/material.dart';
import 'package:foodprint/service/authentication.dart';
import 'package:foodprint/widgets/auth/tokens.dart';
import 'package:foodprint/widgets/authorization_portal.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
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
        storage.write(
          key: "jwt", value: token); // TODO: don't store token locally
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AuthorizationPortal.fromJWT(token))
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
            onPressed:() {
              Navigator.pushNamed(context, "/register");
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
                http.Response res = await AuthenticationService.attemptLogin(_username, _password);
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
              maxLength: 20,
              decoration: InputDecoration(
                  labelText: "Username"
              ),
              onSaved: (String value) {
                _username = value.trim();
              },
              validator: (String value) {
                return value.isEmpty ? 'Please enter a username' : null;
              },
            ),
            SizedBox(height: 12.0),
            TextFormField(
              maxLength: 20,
              decoration: InputDecoration(
                  labelText: "Password"
              ),
              onSaved: (String value) {
                _password = value.trim();
              },
              validator: (String value) {
                return value.isEmpty ? 'Please enter a password' : null;
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
