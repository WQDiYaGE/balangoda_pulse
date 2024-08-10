import 'package:balangoda_pulse/src/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart' as dtp_picker;
import 'package:get/get.dart';

import '../../../../controllers/development_project_controller.dart';
import '../../../../models/development_project_model.dart';

class DevelopmentProjectFormWidget extends StatefulWidget {
  final DevelopmentProjectModel? developmentProject;

  const DevelopmentProjectFormWidget({
    super.key,
    this.developmentProject,
  });

  @override
  State<DevelopmentProjectFormWidget> createState() => _DevelopmentProjectFormWidgetState();
}

class _DevelopmentProjectFormWidgetState extends State<DevelopmentProjectFormWidget> {
  final _formKey = GlobalKey<FormState>();
  late final DevelopmentProjectController _controller;
  late final TextEditingController _projectNameController;
  late final TextEditingController _locationController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _contactInfoController;

  late String _selectedStatus;
  late DateTime _startDate;
  late DateTime _endDate;

  @override
  void initState() {
    super.initState();
    _controller = Get.put(DevelopmentProjectController());
    _projectNameController = TextEditingController(text: widget.developmentProject?.projectName ?? '');
    _startDate = widget.developmentProject?.startDate ?? DateTime.now();
    _endDate = widget.developmentProject?.endDate ?? DateTime.now().add(Duration(days: 1));
    _locationController = TextEditingController(text: widget.developmentProject?.location ?? '');
    _descriptionController = TextEditingController(text: widget.developmentProject?.description ?? '');
    _selectedStatus = widget.developmentProject?.status ?? 'Planning';
    _contactInfoController = TextEditingController(text: widget.developmentProject?.contactInfo ?? '');
  }

  @override
  void dispose() {
    _projectNameController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    _contactInfoController.dispose();
    super.dispose();
  }

  void _selectStartDate(BuildContext context) {
    dtp_picker.DatePickerBdaya.showDateTimePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(2000, 1, 1),
      maxTime: DateTime(2100, 12, 31),
      onConfirm: (date) {
        setState(() {
          _startDate = date;
        });
      },
      currentTime: _startDate,
      locale: dtp_picker.LocaleType.en,
    );
  }

  void _selectEndDate(BuildContext context) {
    dtp_picker.DatePickerBdaya.showDateTimePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(2000, 1, 1),
      maxTime: DateTime(2100, 12, 31),
      onConfirm: (date) {
        setState(() {
          _endDate = date;
        });
      },
      currentTime: _endDate,
      locale: dtp_picker.LocaleType.en,
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
            TextFormField(
              controller: _projectNameController,
              decoration: const InputDecoration(
                labelText: 'Project Name',
                border: borderStyle,
                enabledBorder: borderStyle,
                focusedBorder: borderStyle,
              ),
              validator: (value) => value == null || value.isEmpty ? 'Please enter the project name' : null,
            ),
            const SizedBox(height: CustomSizes.spaceBetweenInputFields),
            InkWell(
              onTap: () => _selectStartDate(context),
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Start Date',
                  border: borderStyle,
                  enabledBorder: borderStyle,
                  focusedBorder: borderStyle,
                ),
                child: Text(
                  "${_startDate.toLocal()}".split(' ')[0],
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            ),
            const SizedBox(height: CustomSizes.spaceBetweenInputFields),
            InkWell(
              onTap: () => _selectEndDate(context),
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'End Date',
                  border: borderStyle,
                  enabledBorder: borderStyle,
                  focusedBorder: borderStyle,
                ),
                child: Text(
                  "${_endDate.toLocal()}".split(' ')[0],
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            ),
            const SizedBox(height: CustomSizes.spaceBetweenInputFields),
            TextFormField(
              controller: _locationController,
              decoration: const InputDecoration(
                labelText: 'Location',
                border: borderStyle,
                enabledBorder: borderStyle,
                focusedBorder: borderStyle,
              ),
              validator: (value) => value == null || value.isEmpty ? 'Please enter the location' : null,
            ),
            const SizedBox(height: CustomSizes.spaceBetweenInputFields),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: borderStyle,
                enabledBorder: borderStyle,
                focusedBorder: borderStyle,
              ),
              maxLines: 5,
              validator: (value) => value == null || value.isEmpty ? 'Please enter the description' : null,
            ),
            const SizedBox(height: CustomSizes.spaceBetweenInputFields),
            DropdownButtonFormField(
                items: [
                  'Planning',
                  'In-Progress',
                  'Completed',
                  'Issues'
                ].map((String status) {
                  return DropdownMenuItem(
                      value: status,
                      child: Text(status)
                  );
                }).toList(),
                value: _selectedStatus,
                onChanged: (newValue) {
                  setState(() {
                    _selectedStatus = newValue!;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Status',
                  border: borderStyle,
                  enabledBorder: borderStyle,
                  focusedBorder: borderStyle,
                ),
                validator: (value) => value == null || value.isEmpty ? 'Please select a status' : null
            ),
            const SizedBox(height: CustomSizes.spaceBetweenInputFields),
            TextFormField(
              controller: _contactInfoController,
              decoration: const InputDecoration(
                labelText: 'Contact Information',
                border: borderStyle,
                enabledBorder: borderStyle,
                focusedBorder: borderStyle,
              ),
              validator: (value) => value == null || value.isEmpty ? 'Please enter the contact information' : null,
            ),
            const SizedBox(height: CustomSizes.spaceBetweenSubSections),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Go back to the previous screen
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.grey[500]
                    ),
                    child: const Text('Cancel'),

                  ),
                ),
                const SizedBox(width: CustomSizes.spaceBetweenCancelAndSubmitButtons),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        final developmentProject = DevelopmentProjectModel(
                          id: widget.developmentProject?.id ?? '',
                          projectName: _projectNameController.text.trim(),
                          startDate: _startDate,
                          endDate: _endDate,
                          location: _locationController.text.trim(),
                          description: _descriptionController.text.trim(),
                          status: _selectedStatus,
                          contactInfo: _contactInfoController.text.trim(),
                        );

                        try {
                          if (widget.developmentProject != null) {
                            await _controller.updateDevelopmentProject(developmentProject);
                          } else {
                            await _controller.saveDevelopmentProject(developmentProject);
                          }
                          Navigator.pop(context); // Go back to the previous screen
                        } catch (e) {
                          Get.snackbar("Error", "Failed to save or update development project! Please try again later!");
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue[600]
                    ),
                    child: Text(widget.developmentProject != null ? 'Update' : 'Save'),
                  ),
                )
              ]
            )
          ],
        ),
      ),
    );
  }
}
