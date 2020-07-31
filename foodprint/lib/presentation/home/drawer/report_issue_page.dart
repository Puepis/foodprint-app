import 'package:bug_report/bug_report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ReportIssuePage extends StatelessWidget {
  static const String routeName = "/report_issue";
  const ReportIssuePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String owner = DotEnv().env['GITHUB_USERNAME'];
    final String repositoryName = DotEnv().env['GITHUB_REPOSITORY'];
    final String accessToken = DotEnv().env['GITHUB_ACCESS_TOKEN'];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Report an Issue"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: IssueForm(
            owner: owner,
            repositoryName: repositoryName,
            authToken: accessToken),
      ),
    );
  }
}
