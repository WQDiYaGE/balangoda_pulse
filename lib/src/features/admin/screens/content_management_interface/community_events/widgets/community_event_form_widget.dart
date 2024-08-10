import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart' as dtp_picker;

import '../../../../../../utils/constants/sizes.dart';
import '../../../../controllers/community_event_controller.dart';
import '../../../../models/community_event_model.dart';

class CommunityEventFormWidget extends StatefulWidget {
  final CommunityEventModel? communityEvent;

  const CommunityEventFormWidget({
    super.key,
    this.communityEvent,
  });

  @override
  State<CommunityEventFormWidget> createState() => _CommunityEventFormWidgetState();
}

class _CommunityEventFormWidgetState extends State<CommunityEventFormWidget> {
  final _formKey = GlobalKey<FormState>();
  late final CommunityEventController _controller;
  late final TextEditingController _nameController;
  late final TextEditingController _locationController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _organizerController;
  late final TextEditingController _rsvpController;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _controller = Get.put(CommunityEventController());
    _nameController = TextEditingController(text: widget.communityEvent?.name ?? '');
    _locationController = TextEditingController(text: widget.communityEvent?.location ?? '');
    _descriptionController = TextEditingController(text: widget.communityEvent?.description ?? '');
    _organizerController = TextEditingController(text: widget.communityEvent?.organizer ?? '');
    _rsvpController = TextEditingController(text: widget.communityEvent?.rsvpDetails ?? '');
    _selectedDate = widget.communityEvent?.dateTime ?? DateTime.now();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    _organizerController.dispose();
    _rsvpController.dispose();
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
                labelText: 'Event Name',
                border: borderStyle,
                enabledBorder: borderStyle,
                focusedBorder: borderStyle,
              ),
              validator: (value) => value == null || value.isEmpty ? 'Please enter the event name' : null,
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
              validator: (value) => value == null || value.isEmpty ? 'Please enter a description' : null,
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
              validator: (value) => value == null || value.isEmpty ? 'Please enter the organizer' : null,
            ),
            const SizedBox(height: CustomSizes.spaceBetweenInputFields),
            TextFormField(
              controller: _rsvpController,
              decoration: const InputDecoration(
                labelText: 'RSVP Details',
                border: borderStyle,
                enabledBorder: borderStyle,
                focusedBorder: borderStyle,
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    final communityEvent = CommunityEventModel(
                      id: widget.communityEvent?.id ?? '',
                      name: _nameController.text.trim(),
                      dateTime: _selectedDate,
                      location: _locationController.text.trim(),
                      description: _descriptionController.text.trim(),
                      organizer: _organizerController.text.trim(),
                      rsvpDetails: _rsvpController.text.trim(),
                    );

                    try {
                      if (widget.communityEvent != null) {
                        await _controller.updateCommunityEvent(communityEvent);
                      } else {
                        await _controller.saveCommunityEvent(communityEvent);
                      }
                      Navigator.pop(context); // Go back to the previous screen
                    } catch (e) {
                      Get.snackbar("Error", "Failed to save or update community event! Please try again later!");
                    }
                  }
                },
                child: Text(widget.communityEvent != null ? 'Update' : 'Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
