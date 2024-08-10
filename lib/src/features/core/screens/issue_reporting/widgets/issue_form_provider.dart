import 'package:flutter/material.dart';

class IssueFormProvider with ChangeNotifier {
  String _issueType = '';
  String _otherIssueType = '';
  String _description = '';
  String _contact = '';
  String? _location;
  List<String> _imageUrls = [];
  DateTime? _dateOfIssue;
  String _additionalInfo = '';

  String get issueType => _issueType;
  String get otherIssueType => _otherIssueType;
  String get description => _description;
  String get contact => _contact;
  String? get location => _location;
  List<String> get imageUrls => _imageUrls;
  DateTime? get dateOfIssue => _dateOfIssue;
  String get additionalInfo => _additionalInfo;

  void updateIssueType(String issueType) {
    _issueType = issueType;
    notifyListeners();
  }

  void updateOtherIssueType(String otherIssueType) {
    _otherIssueType = otherIssueType;
    notifyListeners();
  }

  void updateDescription(String description) {
    _description = description;
    notifyListeners();
  }

  void updateContact(String contact) {
    _contact = contact;
    notifyListeners();
  }

  void updateLocation(String location) { // Allow null assignment
    _location = location;
    notifyListeners();
  }

  void addImageUrl(String imageUrl) {
    _imageUrls.add(imageUrl);
    notifyListeners();
  }

  void updateDateOfIssue(DateTime? date) {
    _dateOfIssue = date;
    notifyListeners();
  }

  void updateAdditionalInfo(String info) {
    _additionalInfo = info;
    notifyListeners();
  }


  void clearAll() {
    _issueType = '';
    _otherIssueType = '';
    _description = '';
    _contact = '';
    _location = null;
    _imageUrls.clear();
    _dateOfIssue = null;
    _additionalInfo = '';
    notifyListeners();
  }
}
