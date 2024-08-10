import 'package:balangoda_pulse/src/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart' as dtp_picker;
import 'package:get/get.dart';

import '../../../../controllers/community_spotlight_controller.dart';
import '../../../../models/community_spotlight_model.dart';

class CommunitySpotlightFormWidget extends StatefulWidget {
  final CommunitySpotlightModel? spotlight;

  const CommunitySpotlightFormWidget({
    super.key,
    this.spotlight,
  });

  @override
  State<CommunitySpotlightFormWidget> createState() => _CommunitySpotlightFormWidgetState();
}

class _CommunitySpotlightFormWidgetState extends State<CommunitySpotlightFormWidget> {
  final _formKey = GlobalKey<FormState>();
  late final CommunitySpotlightController _controller;
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _mediaController;
  late final TextEditingController _testimonialsController;
  late final TextEditingController _contactInfoController;

  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _controller = Get.put(CommunitySpotlightController());
    _nameController = TextEditingController(text: widget.spotlight?.name ?? '');
    _selectedDate = widget.spotlight?.date ?? DateTime.now();
    _descriptionController = TextEditingController(text: widget.spotlight?.description ?? '');
    _mediaController = TextEditingController(text: widget.spotlight?.media?.join(', ') ?? '');
    _testimonialsController = TextEditingController(text: widget.spotlight?.testimonials?.join('\n\n') ?? '');
    _contactInfoController = TextEditingController(text: widget.spotlight?.contactInfo ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _mediaController.dispose();
    _testimonialsController.dispose();
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
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: borderStyle,
                enabledBorder: borderStyle,
                focusedBorder: borderStyle,
              ),
              validator: (value) => value == null || value.isEmpty ? 'Please enter a name' : null,
            ),
            const SizedBox(height: CustomSizes.spaceBetweenInputFields),
            InkWell(
              onTap: () => _selectDate(context),
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Date',
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
              controller: _mediaController,
              decoration: const InputDecoration(
                labelText: 'Media (URLs separated by commas)',
                border: borderStyle,
                enabledBorder: borderStyle,
                focusedBorder: borderStyle,
              ),
              maxLines: 2,
              validator: (value) => value == null || value.isEmpty ? 'Please enter at least one media URL' : null,
            ),
            const SizedBox(height: CustomSizes.spaceBetweenInputFields),
            TextFormField(
              controller: _testimonialsController,
              decoration: const InputDecoration(
                labelText: 'Testimonials (separated by double line breaks)',
                border: borderStyle,
                enabledBorder: borderStyle,
                focusedBorder: borderStyle,
              ),
              maxLines: 5,
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
                    final spotlight = CommunitySpotlightModel(
                      id: widget.spotlight?.id ?? '',
                      name: _nameController.text.trim(),
                      date: _selectedDate,
                      description: _descriptionController.text.trim(),
                      media: _mediaController.text.trim().split(',').map((e) => e.trim()).toList(),
                      testimonials: _testimonialsController.text.trim().split('\n\n'),
                      contactInfo: _contactInfoController.text.trim(),
                    );

                    try {
                      if (widget.spotlight != null) {
                        await _controller.updateCommunitySpotlight(spotlight);
                      } else {
                        await _controller.saveCommunitySpotlight(spotlight);
                      }
                      Navigator.pop(context); // Go back to the previous screen
                    } catch (e) {
                      Get.snackbar("Error", "Failed to save or update spotlight! Please try again later!");
                    }
                  }
                },
                child: Text(widget.spotlight != null ? 'Update' : 'Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
