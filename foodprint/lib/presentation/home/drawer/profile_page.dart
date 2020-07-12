import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = "/profile";
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Profile"),
      ),
    );
  }
}
