import 'package:balangoda_pulse/src/features/core/screens/issue_reporting/multi_step_issue_reporting_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/issue_form_provider.dart';

class IssueReportingScreen extends StatelessWidget {
  const IssueReportingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Report an Issue'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: ChangeNotifierProvider(
              create: (_) => IssueFormProvider(),
              child: const MultiStepIssueReportingForm(),
            ),
          ),
        ),
      ),
    );
  }
}
