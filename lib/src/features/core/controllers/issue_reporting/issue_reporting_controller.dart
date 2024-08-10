import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../screens/issue_reporting/widgets/issue_form_provider.dart';


class IssueReportingController {
  final ImagePicker _picker = ImagePicker();
  final FirebaseStorage _storage = FirebaseStorage.instance;


  // Pick image method
  Future<void> pickImage(IssueFormProvider provider) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      String imageUrl = await _uploadImage(File(pickedFile.path));
      provider.addImageUrl(imageUrl);
    }
  }

  // Upload image to Firebase Storage and get the URL
  Future<String> _uploadImage(File image) async {
    try {
      final storageRef = _storage.ref().child('issue_images/${DateTime.now().millisecondsSinceEpoch}.jpg');
      final uploadTask = await storageRef.putFile(image);
      return await uploadTask.ref.getDownloadURL();
    } catch(e) {
      throw Exception('Error uploading image: $e');
    }
  }
}
