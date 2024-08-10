import 'package:cloud_firestore/cloud_firestore.dart';

class IssueReportingModel {
  String? id; // Firestore document ID
  String issueType;
  String description;
  String contact;
  String? location;
  List<String>? imageUrls; // List of image URLs
  DateTime timestamp; // Converted to DateTime
  DateTime? dateOfIssue; // Converted to DateTime
  String additionalInfo;

  IssueReportingModel({
    this.id,
    required this.issueType,
    required this.description,
    required this.contact,
    this.location,
    this.imageUrls,
    required this.timestamp,
    this.dateOfIssue,
    required this.additionalInfo,
  });

  // Convert to JSON for Firestore
  Map<String, dynamic> toJson() {
    return {
      'issueType': issueType,
      'description': description,
      'contact': contact,
      'location': location,
      'imageUrls': imageUrls,
      'timestamp': Timestamp.fromDate(timestamp), // Store as Timestamp
      'dateOfIssue': dateOfIssue != null ? Timestamp.fromDate(dateOfIssue!) : null,
      'additionalInfo': additionalInfo,
    };
  }

  // Factory method to create an instance from Firestore snapshot
  factory IssueReportingModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return IssueReportingModel(
      id: snapshot.id,
      issueType: data['issueType'],
      description: data['description'],
      contact: data['contact'],
      location: data['location'] as String?,
      imageUrls: data['imageUrls'] != null ? List<String>.from(data['imageUrls']) : null,
      timestamp: (data['timestamp'] as Timestamp).toDate(), // Convert from Timestamp
      dateOfIssue: data['dateOfIssue'] != null ? (data['dateOfIssue'] as Timestamp).toDate() : null,
      additionalInfo: data['additionalInfo']
    );
  }
}
