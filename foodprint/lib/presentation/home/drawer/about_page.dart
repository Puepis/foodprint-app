import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  static const String routeName = "/about";
  const AboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "About"
        ),
      ),
      body: const Center(
        child: Text("About"),
      ),
    );
  }
}
