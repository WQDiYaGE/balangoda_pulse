  import 'package:flutter/material.dart';
  import 'package:provider/provider.dart';

  import '../issue_form_provider.dart';

  class Step1 extends StatelessWidget {
    const Step1({super.key});

    @override
    Widget build(BuildContext context) {
      final provider = Provider.of<IssueFormProvider>(context);

      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: DropdownButtonFormField<String>(
                items: [
                  'Road Damage',
                  'Garbage Collection',
                  'Water Leakage',
                  'Streetlight Malfunction',
                  'Noise Complaint',
                  'Other',
                ].map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                value: provider.issueType.isEmpty ? null : provider.issueType,
                onChanged: (newValue) {
                  provider.updateIssueType(newValue ?? '');
                  if(newValue!='Other') {
                    provider.updateIssueType('');
                  }
                },
                decoration: const InputDecoration(
                  labelText: 'Issue Type',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null || value.isEmpty ? 'Please select an issue type' : null,
              ),
            ),
            const SizedBox(height: 20),
            if (provider.issueType == 'Other')
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Please specify',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => provider.updateOtherIssueType(value),
              ),
            const SizedBox(height: 20),
            if(provider.issueType == 'Other')
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Please specify',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => provider.updateDescription(value)
              ),
            const SizedBox(height: 20),
            TextField(
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => provider.updateDescription(value),
                maxLines: 5
            ),
          ],
        ),
      );
    }
  }
