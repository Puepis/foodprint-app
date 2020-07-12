import 'package:flutter/material.dart';

class ReportIssuePage extends StatelessWidget {
  static const String routeName = "/report_issue";
  const ReportIssuePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Report an issue"),
      ),
    );
  }
}
