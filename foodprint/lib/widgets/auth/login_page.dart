import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  String _username, _password;
  final List<Permission> _permissions = [Permission.location, Permission.camera];

  Future<void> _requestPermissions() async {
    for (final Permission permission in _permissions) {
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
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(height: 2.5,),
              const Text(
                "Sign in to continue",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey
                ),
              ),
              const SizedBox(height: 60.0,),
              loginForm(),
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
                  const SizedBox(width: 4.0,),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/register");
                    },
                    child: const Text(
                      "Register",
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
    );
  }

  void handleLoginResponse(BuildContext context, http.Response res) {
    setState(() {
      loading = false;
    });

    switch (res.statusCode) {
      case 200: { // success
        final String token = res.body;
        storage.write(
          key: "jwt", value: token); // TODO: don't store token locally
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AuthorizationPortal.fromJWT(token))
        );
      }
      break;
      case 401:
      default: {
          print(res.body);
      }
    }
  }

  Form loginForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
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
              return value.isEmpty ? 'Please enter a username' : null;
            },
          ),
          const SizedBox(height: 20,),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7.0)
              )
            ),
            onSaved: (String value) {
              _password = value.trim();
            },
            validator: (String value) {
              return value.isEmpty ? 'Please enter a password' : null;
            },
            obscureText: true,
          ),
          const SizedBox(height: 15,),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
              },
              child: const Text(
                "Forgot Password?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
          ),
          const SizedBox(height: 30.0,),
          if (loading) const SpinKitWave(color: Colors.orange, size: 40.0)
          else ButtonTheme(
            height: 50,
            child: RaisedButton(
              color: Colors.orange,
              shape: const RoundedRectangleBorder(
                borderRadius:BorderRadius.all(Radius.circular(7)),
              ),
              onPressed:() async {
                if (_formKey.currentState.validate()) {
                  setState(() {
                    loading = true;
                  });
                  _formKey.currentState.save();
                  _formKey.currentState.reset();
                  final http.Response res = await AuthenticationService.attemptLogin(_username, _password);
                  handleLoginResponse(context, res);
                }
              },
              child: const Text(
                'Login',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
