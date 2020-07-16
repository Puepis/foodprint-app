import 'package:flutter/material.dart';

class TermsOfService extends StatelessWidget {
  static const String routeName = "/tos";
  const TermsOfService({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms & Conditions"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Text("Terms & Conditions"),
      ),
    );
  }
}
