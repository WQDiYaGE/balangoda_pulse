import 'package:balangoda_pulse/src/features/core/screens/issue_reporting/widgets/issue_form_provider.dart';
import 'package:balangoda_pulse/src/features/core/screens/issue_reporting/widgets/steppers/step1.dart';
import 'package:balangoda_pulse/src/features/core/screens/issue_reporting/widgets/steppers/step2.dart';
import 'package:balangoda_pulse/src/features/core/screens/issue_reporting/widgets/steppers/step3.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/issue_reporting/issue_reporting_model.dart';

class MultiStepIssueReportingForm extends StatefulWidget {
  const MultiStepIssueReportingForm({super.key});

  @override
  State<MultiStepIssueReportingForm> createState() => _MultiStepIssueReportingFormState();
}

class _MultiStepIssueReportingFormState extends State<MultiStepIssueReportingForm> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<IssueFormProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width,
              ),
              child: Stepper(
                currentStep: _currentStep,
                onStepCancel: _currentStep == 0
                    ? null
                    : () {
                  setState(() {
                    _currentStep -= 1;
                  });
                },
                onStepContinue: _currentStep == 2
                    ? _submitForm
                    : () {
                  setState(() {
                    _currentStep += 1;
                  });
                },
                steps: [
                  Step(
                    title: const Text('Step 1'),
                    content: const Step1(),
                    isActive: _currentStep >= 0,
                  ),
                  Step(
                    title: const Text('Step 2'),
                    content: Step2(),
                    isActive: _currentStep >= 1,
                  ),
                  Step(
                    title: const Text('Step 3'),
                    content: const Step3(),
                    isActive: _currentStep >= 2,
                  ),
                ],
                controlsBuilder: (BuildContext context, ControlsDetails details) {
                  final isLastStep = _currentStep == 2;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      if (_currentStep != 0)
                        TextButton(
                          onPressed: details.onStepCancel,
                          child: const Text('Back'),
                        ),
                      ElevatedButton(
                        onPressed: details.onStepContinue,
                        child: Text(isLastStep ? 'Submit' : 'Next'),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),

    );
  }

  void _submitForm() async {
    final provider = Provider.of<IssueFormProvider>(context, listen: false);

    // Validate input
    if (provider.issueType.isEmpty || provider.description.isEmpty || provider.contact.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please fill all required fields')));
      return;
    }

    final issue = IssueReportingModel(
      issueType: provider.issueType == 'Other' ? provider.otherIssueType : provider.issueType,
      description: provider.description,
      contact: provider.contact,
      location: provider.location,
      imageUrls: provider.imageUrls,
      timestamp: DateTime.now(),
      dateOfIssue: provider.dateOfIssue,
      additionalInfo: provider.additionalInfo,
    );

    // Save to Firestore
    try {
      await FirebaseFirestore.instance.collection('issueReports').add(issue.toJson());

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Success'),
            content: const Text('Issue reported successfully!'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  Navigator.of(context).pop(); // Close the form screen
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      ).then((_) {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context).pop(); // Close the form screen
        });
      });

      provider.clearAll();
    } catch (e) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Failed to report issue'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      ).then((_) {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context).pop(); // Close the form screen
        });
      });
    }
  }
}
