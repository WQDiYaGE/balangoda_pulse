import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart' as dtp_picker;
import 'package:get/get.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../../../../controllers/local_news_controller.dart';
import '../../../../models/local_news_model.dart';

class LocalNewsFormWidget extends StatefulWidget {
  final LocalNewsModel? localNews;

  const LocalNewsFormWidget({
    super.key,
    this.localNews,
  });

  @override
  State<LocalNewsFormWidget> createState() => _LocalNewsFormWidgetState();
}

class _LocalNewsFormWidgetState extends State<LocalNewsFormWidget> {
  final _formKey = GlobalKey<FormState>();
  late final LocalNewsController _controller;
  late final TextEditingController _headlineController;
  late final TextEditingController _publicationDateController;
  late final TextEditingController _summaryController;
  late final TextEditingController _embeddedArticleController;
  late final TextEditingController _sourceController;

  @override
  void initState() {
    super.initState();
    _controller = Get.put(LocalNewsController());
    _headlineController = TextEditingController(text: widget.localNews?.headline ?? '');
    _publicationDateController = TextEditingController(text: widget.localNews?.publicationDate != null
        ? widget.localNews!.publicationDate.toString()
        : '');
    _summaryController = TextEditingController(text: widget.localNews?.summary ?? '');
    _embeddedArticleController = TextEditingController(text: widget.localNews?.embeddedArticle ?? '');
    _sourceController = TextEditingController(text: widget.localNews?.source ?? '');
  }

  @override
  void dispose() {
    _headlineController.dispose();
    _publicationDateController.dispose();
    _summaryController.dispose();
    _embeddedArticleController.dispose();
    _sourceController.dispose();
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
        _publicationDateController.text = pickedDate.toIso8601String();
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
              controller: _headlineController,
              decoration: const InputDecoration(
                  labelText: 'Headline',
                  border: borderStyle,
                  enabledBorder: borderStyle,
                  focusedBorder: borderStyle
              ),
              validator: (value) => value == null || value.isEmpty ? 'Please enter a headline' : null,
            ),
            const SizedBox(height: CustomSizes.spaceBetweenInputFields),
            TextFormField(
              controller: _publicationDateController,
              decoration: const InputDecoration(
                  labelText: 'Publication Date',
                  border: borderStyle,
                  enabledBorder: borderStyle,
                  focusedBorder: borderStyle,
                  suffixIcon: Icon(Icons.calendar_today)
              ),
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
                _selectDate();
              },
              validator: (value) => value == null || value.isEmpty ? 'Please enter a publication date' : null,
            ),
            const SizedBox(height: CustomSizes.spaceBetweenInputFields),
            TextFormField(
              controller: _summaryController,
              decoration: const InputDecoration(
                  labelText: 'Summary',
                  border: borderStyle,
                  enabledBorder: borderStyle,
                  focusedBorder: borderStyle
              ),
              maxLines: 3,
              validator: (value) => value == null || value.isEmpty ? 'Please enter a summary' : null,
            ),
            const SizedBox(height: CustomSizes.spaceBetweenInputFields),
            TextFormField(
              controller: _embeddedArticleController,
              decoration: const InputDecoration(
                  labelText: 'Embedded Article',
                  border: borderStyle,
                  enabledBorder: borderStyle,
                  focusedBorder: borderStyle
              ),
              maxLines: 5,
              validator: (value) => value == null || value.isEmpty ? 'Please enter the article' : null,
            ),
            const SizedBox(height: CustomSizes.spaceBetweenInputFields),
            TextFormField(
              controller: _sourceController,
              decoration: const InputDecoration(
                  labelText: 'Source',
                  border: borderStyle,
                  enabledBorder: borderStyle,
                  focusedBorder: borderStyle
              ),
              validator: (value) => value == null || value.isEmpty ? 'Please enter the source' : null,
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    final localNews = LocalNewsModel(
                      id: widget.localNews?.id ?? '',
                      headline: _headlineController.text.trim(),
                      publicationDate: DateTime.parse(_publicationDateController.text.trim()),
                      summary: _summaryController.text.trim(),
                      embeddedArticle: _embeddedArticleController.text.trim(),
                      source: _sourceController.text.trim(),
                    );

                    try {
                      if (widget.localNews != null) {
                        await _controller.updateLocalNews(localNews);
                      } else {
                        await _controller.saveLocalNews(localNews);
                      }
                      Navigator.pop(context); // Go back to the previous screen
                    } catch(e) {
                      Get.snackbar("Error", "Failed to save or update local news! Please try again later!");
                    }
                  }
                },
                child: Text(widget.localNews != null ? 'Update' : 'Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
