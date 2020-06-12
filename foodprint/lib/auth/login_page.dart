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

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    _passwordController.dispose();
    _usernameController.dispose();
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
            credentialSection(),
            buttonSection()
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

  ButtonBar buttonSection() {
    return ButtonBar(
      children: <Widget>[
        RaisedButton(
            elevation: 3.0,
            child: Text('Sign Up Here'),
            shape: BeveledRectangleBorder(
              borderRadius:BorderRadius.all(Radius.circular(7.0)),
            ),
            onPressed:() async {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()
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
              String username = _usernameController.text.trim();
              String password = _passwordController.text.trim();
              _usernameController.clear();
              _passwordController.clear();
              http.Response res = await AuthService.attemptLogin(
                  username, password);
              handleLoginResponse(context, res);
            }
        ),
      ],
    );
  }
  Container credentialSection() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      margin: EdgeInsets.only(top: 30.0),
      child: Column(
        children: <Widget>[
          usernameField("Username"),
          SizedBox(height: 12.0),
          passwordField("Password")
        ],
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
      child: Text("Foodprint"),
    );
  }
}
