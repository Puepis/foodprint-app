import 'package:flutter/material.dart';
import 'package:foodprint/auth/tokens.dart';
import 'package:foodprint/home.dart';
import 'package:foodprint/auth/register_page.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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

  void displayDialog(context, title, text) => showDialog(
    context: context,
    builder: (context) =>
        AlertDialog(
            title: Text(title),
            content: Text(text)
        ),
  );

  Future<String> attemptLogin(String username, String password) async {
    var res = await http.post(
        "$SERVER_IP/api/users/login",
        body: {
          "username": username,
          "password": password
        }
    );

    // Make this better
    return (res.statusCode == 200) ? res.body : null;
  }

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
              var username = _usernameController.text.trim();
              var password = _passwordController.text.trim();
              _usernameController.clear();
              _passwordController.clear();
              var jwt = await attemptLogin(username, password);
              if (jwt != null) {
                storage.write(key: "jwt", value: jwt);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage.construct(jwt))
                );
              } else {
                displayDialog(context, "Invalid Credentials", "Invalid username/password.");
              }
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
