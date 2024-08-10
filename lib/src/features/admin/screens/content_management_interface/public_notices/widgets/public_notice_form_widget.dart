import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart' as dtp_picker;
import 'package:get/get.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../../../../controllers/public_notice_controller.dart';
import '../../../../models/public_notice_model.dart';

class PublicNoticeFormWidget extends StatefulWidget {
  final PublicNoticeModel? publicNotice;

  const PublicNoticeFormWidget({
    super.key,
    this.publicNotice,
  });

  @override
  State<PublicNoticeFormWidget> createState() => _PublicNoticeFormWidgetState();
}

class _PublicNoticeFormWidgetState extends State<PublicNoticeFormWidget> {
  final _formKey = GlobalKey<FormState>();
  late final PublicNoticeController _controller;
  late final TextEditingController _titleController;
  late final TextEditingController _dateTimeController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _contactInfoController;
  final List<DateTime> _relevantDates = [];
  final List<String> _attachments = [];

  @override
  void initState() {
    super.initState();
    _controller = Get.put(PublicNoticeController());
    _titleController = TextEditingController(text: widget.publicNotice?.title ?? '');
    _dateTimeController = TextEditingController(text: widget.publicNotice?.dateTime != null
        ? widget.publicNotice!.dateTime.toString()
        : '');
    _descriptionController = TextEditingController(text: widget.publicNotice?.description ?? '');
    _contactInfoController = TextEditingController(text: widget.publicNotice?.contactInfo ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _dateTimeController.dispose();
    _descriptionController.dispose();
    _contactInfoController.dispose();
    super.dispose();
  }

  void _selectDate() async {
    final DateTime? pickedDate = await dtp_picker.DatePickerBdaya.showDateTimePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(2000),
      maxTime: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _dateTimeController.text = pickedDate.toIso8601String();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide()
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                  labelText: 'Title',
                  border: borderStyle,
                  enabledBorder: borderStyle,
                  focusedBorder: borderStyle
              ),
              validator: (value) => value == null || value.isEmpty ? 'Please enter a title' : null,
            ),
            const SizedBox(height: CustomSizes.spaceBetweenInputFields),
            TextFormField(
              controller: _dateTimeController,
              decoration: const InputDecoration(
                  labelText: 'Date & Time',
                  border: borderStyle,
                  enabledBorder: borderStyle,
                  focusedBorder: borderStyle,
                  suffixIcon: Icon(Icons.calendar_today)
              ),
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
                _selectDate();
              },
              validator: (value) => value == null || value.isEmpty ? 'Please enter the date and time' : null,
            ),
            const SizedBox(height: CustomSizes.spaceBetweenInputFields),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                  labelText: 'Description',
                  border: borderStyle,
                  enabledBorder: borderStyle,
                  focusedBorder: borderStyle
              ),
              maxLines: 5,
              validator: (value) => value == null || value.isEmpty ? 'Please enter a description' : null,
            ),
            const SizedBox(height: CustomSizes.spaceBetweenInputFields),
            TextFormField(
              controller: _contactInfoController,
              decoration: const InputDecoration(
                  labelText: 'Contact Information',
                  border: borderStyle,
                  enabledBorder: borderStyle,
                  focusedBorder: borderStyle
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    final publicNotice = PublicNoticeModel(
                      id: widget.publicNotice?.id ?? '',
                      title: _titleController.text.trim(),
                      dateTime: DateTime.parse(_dateTimeController.text.trim()),
                      description: _descriptionController.text.trim(),
                      relevantDates: _relevantDates,
                      attachments: _attachments,
                      contactInfo: _contactInfoController.text.trim(),
                    );

                    try {
                      if (widget.publicNotice != null) {
                        _controller.updatePublicNotice(publicNotice);
                      } else {
                        _controller.savePublicNotice(publicNotice);
                      }
                      Navigator.pop(context); // Go back to the previous screen
                    } catch(e) {
                      Get.snackbar("Error", "Failed to save or update public notice! Please try again later!");
                    }
                  }
                },
                child: Text(widget.publicNotice != null ? 'Update' : 'Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
