import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart' as dtp_picker;

import '../issue_form_provider.dart';

class Step3 extends StatelessWidget {
  const Step3({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<IssueFormProvider>(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Contact Information',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => provider.updateContact(value),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () => _selectDateTime(context, provider),
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Date & Time',
                border: OutlineInputBorder(),
              ),
              child: Text(
                provider.dateOfIssue != null
                    ? '${provider.dateOfIssue!.toLocal()}'.split(' ')[0]
                    : 'Select Date & Time',
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Additional Information (Optional)',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => provider.updateAdditionalInfo(value),
            maxLines: 3,
          ),
        ],
      ),
    );
  }

  void _selectDateTime(BuildContext context, IssueFormProvider provider) {
    dtp_picker.DatePickerBdaya.showDateTimePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(2000, 1, 1),
      maxTime: DateTime(2100, 12, 31),
      onConfirm: (date) {
        provider.updateDateOfIssue(date);
      },
      currentTime: provider.dateOfIssue ?? DateTime.now(),
      locale: dtp_picker.LocaleType.en,
    );
  }
}
