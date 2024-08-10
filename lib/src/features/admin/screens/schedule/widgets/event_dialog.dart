import 'package:flutter/material.dart';
import 'events_extracted.dart'; // Make sure the import path is correct

class EventDialog extends StatefulWidget {
  final EventsExtracted? event;
  final Function(EventsExtracted) onSave;

  const EventDialog({super.key, this.event, required this.onSave});

  @override
  State<EventDialog> createState() => _EventDialogState();
}

class _EventDialogState extends State<EventDialog> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late DateTime _date;
  late String _description;
  late String _category; // Make sure this matches the EventsExtracted class

  @override
  void initState() {
    super.initState();
    _title = widget.event?.title ?? '';
    _date = widget.event?.date ?? DateTime.now();
    _description = widget.event?.description ?? '';
    _category = widget.event?.category ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.event == null ? 'Create New Event' : 'Edit Event'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: _title,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value!;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                initialValue: _date.toLocal().toString().split(' ')[0],
                decoration: const InputDecoration(labelText: 'Date (YYYY-MM-DD)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a date';
                  }
                  try {
                    _date = DateTime.parse(value);
                  } catch (e) {
                    return 'Invalid date format';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                initialValue: _description,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!;
                },
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _category.isNotEmpty ? _category : null,
                decoration: const InputDecoration(labelText: 'Category'),
                items: [
                  'Community Events',
                  'Charity',
                  'Public Service',
                  'Social',
                  'Educational',
                  'Entertainment'
                ].map((category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _category = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a category';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              widget.onSave(EventsExtracted(
                title: _title,
                date: _date,
                description: _description,
                category: _category,
              ));
              Navigator.of(context).pop();
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
