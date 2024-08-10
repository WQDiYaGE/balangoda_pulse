import 'package:balangoda_pulse/src/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart' as dtp_picker;
import 'package:get/get.dart';

import '../../../../controllers/emergency_alert_controller.dart';
import '../../../../models/emergency_alert_model.dart';

class EmergencyAlertFormWidget extends StatefulWidget {
  final EmergencyAlertModel? emergencyAlert;

  const EmergencyAlertFormWidget({
    super.key,
    this.emergencyAlert,
  });

  @override
  State<EmergencyAlertFormWidget> createState() => _EmergencyAlertFormWidgetState();
}

class _EmergencyAlertFormWidgetState extends State<EmergencyAlertFormWidget> {
  final _formKey = GlobalKey<FormState>();
  late final EmergencyAlertController _controller;
  late final TextEditingController _detailedInformationController;
  late final TextEditingController _instructionsController;
  late final TextEditingController _contactDetailsController;

  late String _selectedAlertType;
  late String _selectedUrgencyLevel;
  late DateTime _dateTime;

  @override
  void initState() {
    super.initState();
    _controller = Get.put(EmergencyAlertController());
    _selectedAlertType = widget.emergencyAlert?.type ?? 'Natural Disasters';
    _dateTime = widget.emergencyAlert?.dateTime ?? DateTime.now();
    _selectedUrgencyLevel = widget.emergencyAlert?.urgencyLevel ?? 'Low';
    _detailedInformationController = TextEditingController(text: widget.emergencyAlert?.detailedInformation ?? '');
    _instructionsController = TextEditingController(text: widget.emergencyAlert?.instructions ?? '');
    _contactDetailsController = TextEditingController(text: widget.emergencyAlert?.contactDetails ?? '');
  }

  @override
  void dispose() {
    _detailedInformationController.dispose();
    _instructionsController.dispose();
    _contactDetailsController.dispose();
    super.dispose();
  }

  void _selectDateTime(BuildContext context) {
    dtp_picker.DatePickerBdaya.showDateTimePicker(
        context,
        showTitleActions: true,
        minTime: DateTime(2000, 1, 1),
        maxTime: DateTime(2100, 12, 31),
        onConfirm: (date) {
          setState(() {
            _dateTime = date;
          });
        },
        currentTime: _dateTime,
        locale: dtp_picker.LocaleType.en
    );
  }

  @override
  Widget build(BuildContext context) {
    const borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(),
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField(
                items: [
                  'Natural Disasters',
                  'Health Alerts',
                  'Safety & Security',
                  'Weather Alerts'
                ].map((String alert) {
                  return DropdownMenuItem(
                      value: alert,
                      child: Text(alert)
                  );
                }).toList(),
                value: _selectedAlertType,
                onChanged: (newValue) {
                  setState(() {
                    _selectedAlertType = newValue!;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Alert Type',
                  border: borderStyle,
                  enabledBorder: borderStyle,
                  focusedBorder: borderStyle,
                ),
                validator: (value) => value == null || value.isEmpty ? 'Please select an alert type' : null
            ),
            const SizedBox(height: CustomSizes.spaceBetweenInputFields),
            InkWell(
              onTap: () => _selectDateTime(context),
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Date & Time',
                  border: borderStyle,
                  enabledBorder: borderStyle,
                  focusedBorder: borderStyle,
                ),
                child: Text(
                  "${_dateTime.toLocal()}".split(' ')[0],
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            ),
            const SizedBox(height: CustomSizes.spaceBetweenInputFields),
            DropdownButtonFormField(
                items: [
                  'Low',
                  'Moderate',
                  'High',
                  'Critical'
                ].map((String level) {
                  return DropdownMenuItem(
                      value: level,
                      child: Text(level)
                  );
                }).toList(),
                value: _selectedUrgencyLevel,
                onChanged: (newValue) {
                  setState(() {
                    _selectedUrgencyLevel = newValue!;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Urgency Level',
                  border: borderStyle,
                  enabledBorder: borderStyle,
                  focusedBorder: borderStyle,
                ),
                validator: (value) => value == null || value.isEmpty ? 'Please select an urgency level' : null
            ),
            const SizedBox(height: CustomSizes.spaceBetweenInputFields),
            TextFormField(
              controller: _detailedInformationController,
              decoration: const InputDecoration(
                labelText: 'Detailed Information',
                border: borderStyle,
                enabledBorder: borderStyle,
                focusedBorder: borderStyle,
              ),
              maxLines: 5,
              validator: (value) => value == null || value.isEmpty ? 'Please enter detailed information' : null,
            ),
            const SizedBox(height: CustomSizes.spaceBetweenInputFields),
            TextFormField(
              controller: _instructionsController,
              decoration: const InputDecoration(
                labelText: 'Instructions',
                border: borderStyle,
                enabledBorder: borderStyle,
                focusedBorder: borderStyle,
              ),
              maxLines: 5,
              validator: (value) => value == null || value.isEmpty ? 'Please enter instructions' : null,
            ),
            const SizedBox(height: CustomSizes.spaceBetweenInputFields),
            TextFormField(
              controller: _contactDetailsController,
              decoration: const InputDecoration(
                labelText: 'Contact Details',
                border: borderStyle,
                enabledBorder: borderStyle,
                focusedBorder: borderStyle,
              ),
              validator: (value) => value == null || value.isEmpty ? 'Please enter contact details' : null,
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    final emergencyAlert = EmergencyAlertModel(
                      id: widget.emergencyAlert?.id ?? '',
                      type: _selectedAlertType,
                      dateTime: _dateTime,
                      urgencyLevel: _selectedUrgencyLevel,
                      detailedInformation: _detailedInformationController.text.trim(),
                      instructions: _instructionsController.text.trim(),
                      contactDetails: _contactDetailsController.text.trim(),
                    );

                    try {
                      if (widget.emergencyAlert != null) {
                        await _controller.updateEmergencyAlert(emergencyAlert);
                      } else {
                        await _controller.saveEmergencyAlert(emergencyAlert);
                      }
                      Navigator.pop(context); // Go back to the previous screen
                    } catch (e) {
                      Get.snackbar("Error", "Failed to save or update emergency alert! Please try again later!");
                    }
                  }
                },
                child: Text(widget.emergencyAlert != null ? 'Update' : 'Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
