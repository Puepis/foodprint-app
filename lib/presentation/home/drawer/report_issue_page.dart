import 'package:bug_report/bug_report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodprint/presentation/core/styles/gradients.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

/// The page where users can report a bug to the app's repository. 
/// 
/// Uses the [bug_report] package. 
class ReportIssuePage extends StatelessWidget {
  static const String routeName = "/report_issue";
  const ReportIssuePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // GitHub information 
    final String owner = DotEnv().env['GITHUB_USERNAME'];
    final String repositoryName = DotEnv().env['GITHUB_REPOSITORY'];
    final String accessToken = DotEnv().env['GITHUB_ACCESS_TOKEN'];
    return Scaffold(
      appBar: GradientAppBar(
        gradient: LinearGradient(
          colors: sweetMorningGradient,
        ),
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
