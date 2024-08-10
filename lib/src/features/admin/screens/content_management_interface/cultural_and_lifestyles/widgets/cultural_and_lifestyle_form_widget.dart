import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart' as dtp_picker;
import '../../../../../../utils/constants/sizes.dart';
import '../../../../controllers/cultural_and_lifestyle_controller.dart';
import '../../../../models/cultural_and_lifestyle_model.dart';

class CulturalAndLifestyleFormWidget extends StatefulWidget {
  final CulturalAndLifestyleModel? culturalAndLifestyle;

  const CulturalAndLifestyleFormWidget({
    super.key,
    this.culturalAndLifestyle,
  });

  @override
  State<CulturalAndLifestyleFormWidget> createState() => _CulturalAndLifestyleFormWidgetState();
}

class _CulturalAndLifestyleFormWidgetState extends State<CulturalAndLifestyleFormWidget> {
  final _formKey = GlobalKey<FormState>();
  late final CulturalAndLifestyleController _controller;
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _moreInfoLinkController;
  late final TextEditingController _organizerController;

  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _controller = Get.put(CulturalAndLifestyleController());
    _titleController = TextEditingController(text: widget.culturalAndLifestyle?.title ?? '');
    _selectedDate = widget.culturalAndLifestyle?.dateTime ?? DateTime.now();
    _descriptionController = TextEditingController(text: widget.culturalAndLifestyle?.description ?? '');
    _moreInfoLinkController = TextEditingController(text: widget.culturalAndLifestyle?.moreInfoLink ?? '');
    _organizerController = TextEditingController(text: widget.culturalAndLifestyle?.organizer ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _moreInfoLinkController.dispose();
    _organizerController.dispose();
    super.dispose();
  }

  void _selectDate(BuildContext context) {
    dtp_picker.DatePickerBdaya.showDateTimePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(2022, 1, 1),
      maxTime: DateTime(2030, 12, 31),
      onChanged: (date) {
        setState(() {
          _selectedDate = date;
        });
      },
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
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: borderStyle,
                enabledBorder: borderStyle,
                focusedBorder: borderStyle,
              ),
              validator: (value) =>
              value == null || value.isEmpty ? 'Please enter the title' : null,
            ),
            const SizedBox(height: CustomSizes.spaceBetweenInputFields),
            TextFormField(
              readOnly: true,
              onTap: () => _selectDate(context),
              decoration: InputDecoration(
                labelText: 'Date & Time',
                border: borderStyle,
                enabledBorder: borderStyle,
                focusedBorder: borderStyle,
                hintText: _selectedDate.toLocal().toString(),
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
              validator: (value) => value == null || value.isEmpty
                  ? 'Please enter the description'
                  : null,
            ),
            const SizedBox(height: CustomSizes.spaceBetweenInputFields),
            TextFormField(
              controller: _moreInfoLinkController,
              decoration: const InputDecoration(
                labelText: 'More Info Link',
                border: borderStyle,
                enabledBorder: borderStyle,
                focusedBorder: borderStyle,
              ),
            ),
            const SizedBox(height: CustomSizes.spaceBetweenInputFields),
            TextFormField(
              controller: _organizerController,
              decoration: const InputDecoration(
                labelText: 'Organizer',
                border: borderStyle,
                enabledBorder: borderStyle,
                focusedBorder: borderStyle,
              ),
              validator: (value) =>
              value == null || value.isEmpty ? 'Please enter the organizer name' : null,
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    final culturalLifestyle = CulturalAndLifestyleModel(
                      id: widget.culturalAndLifestyle?.id ?? '',
                      title: _titleController.text.trim(),
                      dateTime: _selectedDate,
                      description: _descriptionController.text.trim(),
                      relatedMedia: [], // Handle media separately
                      moreInfoLink: _moreInfoLinkController.text.trim(),
                      organizer: _organizerController.text.trim(),
                    );

                    try {
                      if (widget.culturalAndLifestyle != null) {
                        await _controller.updateCulturalAndLifestyle(culturalLifestyle);
                      } else {
                        await _controller.saveCulturalAndLifestyle(culturalLifestyle);
                      }
                      Navigator.pop(context); // Go back to the previous screen
                    } catch(e) {
                      Get.snackbar("Error", "Failed to save or update the cultural and lifestyle! Please try again later!");
                    }
                  }
                },
                child: Text(widget.culturalAndLifestyle != null ? 'Update' : 'Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
