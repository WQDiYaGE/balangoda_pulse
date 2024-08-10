import 'package:balangoda_pulse/src/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart' as dtp_picker;
import 'package:get/get.dart';

import '../../../../controllers/announcement_controller.dart';
import '../../../../models/announcement_model.dart';

class AnnouncementFormWidget extends StatefulWidget {
  final AnnouncementModel? announcement;

  const AnnouncementFormWidget({
    super.key,
    this.announcement,
  });

  @override
  State<AnnouncementFormWidget> createState() => _AnnouncementFormWidgetState();
}

class _AnnouncementFormWidgetState extends State<AnnouncementFormWidget> {
  final _formKey = GlobalKey<FormState>();
  late final AnnouncementController _controller;
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _moreDetailsController;
  late final TextEditingController _contactInfoController;

  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _controller = Get.put(AnnouncementController());
    _titleController = TextEditingController(text: widget.announcement?.title ?? '');
    _selectedDate = widget.announcement?.dateTime ?? DateTime.now();
    _descriptionController = TextEditingController(text: widget.announcement?.description ?? '');
    _moreDetailsController = TextEditingController(text: widget.announcement?.moreDetailsLink ?? '');
    _contactInfoController = TextEditingController(text: widget.announcement?.contactInfo ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _moreDetailsController.dispose();
    _contactInfoController.dispose();
    super.dispose();
  }

  void _selectDate(BuildContext context) {
    dtp_picker.DatePickerBdaya.showDateTimePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(2000, 1, 1),
      maxTime: DateTime(2100, 12, 31),
      onConfirm: (date) {
        setState(() {
          _selectedDate = date;
        });
      },
      currentTime: _selectedDate,
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
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: borderStyle,
                enabledBorder: borderStyle,
                focusedBorder: borderStyle,
              ),
              validator: (value) => value == null || value.isEmpty ? 'Please enter a title' : null,
            ),
            const SizedBox(height: CustomSizes.spaceBetweenInputFields),
            InkWell(
              onTap: () => _selectDate(context),
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Date and Time',
                  border: borderStyle,
                  enabledBorder: borderStyle,
                  focusedBorder: borderStyle,
                ),
                child: Text(
                  "${_selectedDate.toLocal()}".split(' ')[0],
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
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
              validator: (value) => value == null || value.isEmpty ? 'Please enter a description' : null,
            ),
            const SizedBox(height: CustomSizes.spaceBetweenInputFields),
            TextFormField(
              controller: _moreDetailsController,
              decoration: const InputDecoration(
                labelText: 'More Details Link',
                border: borderStyle,
                enabledBorder: borderStyle,
                focusedBorder: borderStyle,
              ),
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
            ),
            const SizedBox(height: CustomSizes.spaceBetweenSubSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    final announcement = AnnouncementModel(
                      id: widget.announcement?.id ?? '',
                      title: _titleController.text.trim(),
                      dateTime: _selectedDate,
                      description: _descriptionController.text.trim(),
                      moreDetailsLink: _moreDetailsController.text.trim(),
                      contactInfo: _contactInfoController.text.trim(),
                    );

                    try {
                      if (widget.announcement != null) {
                        await _controller.updateAnnouncement(announcement);
                      } else {
                        await _controller.saveAnnouncement(announcement);
                      }
                      Navigator.pop(context); // Go back to the previous screen
                    } catch(e) {
                      Get.snackbar("Error", "Failed to save or update announcement! Please try again later!");
                    }
                  }
                },
                child: Text(widget.announcement != null ? 'Update' : 'Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
