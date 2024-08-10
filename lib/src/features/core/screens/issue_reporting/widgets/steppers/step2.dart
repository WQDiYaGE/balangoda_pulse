import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../issue_form_provider.dart';

class Step2 extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();

  Step2({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<IssueFormProvider>(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () => _pickImage(provider),
            child: const Text('Upload Image'),
          ),
          const SizedBox(height: 20),
          Text(provider.imageUrls.isNotEmpty ? 'Image selected' : 'No image selected'),
          const SizedBox(height: 20),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Location (Optional)',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => provider.updateLocation(value),
          ),
          const SizedBox(height: 20),
          Text(provider.location != null ? 'Location: ${provider.location}' : 'Location not set'),
        ],
      ),
    );
  }

  Future<void> _pickImage(IssueFormProvider provider) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Assuming you upload the image and get the URL, then add it
      String imageUrl = pickedFile.path; // This should be the URL of the uploaded image
      provider.addImageUrl(imageUrl);
    }
  }
}
