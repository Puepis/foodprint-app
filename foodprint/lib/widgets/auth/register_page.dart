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
                    "Create an account",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  const SizedBox(height: 2.5,),
                  const Text(
                    "to begin tracking your foodprint",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey
                    ),
                  ),
                  const SizedBox(height: 60.0,),
                  registerForm(),
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
                      const SizedBox(width: 4.0,),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                              fontSize: 14.0
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
        ),
      ),
    );
  }

  void displayDialog(BuildContext context, String title, String text) => showDialog(
    context: context,
    builder: (context) =>
        AlertDialog(
            title: Text(title),
            content: Text(text)
        ),
  );

  Form registerForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.0)
              ),
            ),
            onSaved: (String value) {
              _email = value.trim();
            },
            validator: (String value) {
              final RegExp re = RegExp(r"\S+@\S+\.\S+"); // matches anystring@anystring.anystring
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
          const SizedBox(height: 20.0),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Username",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.0)
              ),
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
          const SizedBox(height: 20,),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Password",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.0)
              ),
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
          ),
          const SizedBox(height: 30),
          ButtonTheme(
            height: 50,
            child: RaisedButton(
              color: Colors.orange,
              shape: const RoundedRectangleBorder(
                borderRadius:BorderRadius.all(Radius.circular(7.0)),
              ),
              onPressed:() async {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  _formKey.currentState.reset();
                  final http.Response res = await AuthenticationService.attemptSignUp(_email, _username, _password);
                  handleRegisterResponse(context, res);
                }
              },
              child: const Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
