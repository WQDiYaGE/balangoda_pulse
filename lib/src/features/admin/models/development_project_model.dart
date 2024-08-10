import 'package:cloud_firestore/cloud_firestore.dart';

class DevelopmentProjectModel {
  String? id;
  String projectName;
  DateTime startDate;
  DateTime endDate;
  String location; // Location with map integration
  String description;
  String status; // Status updates (e.g., planned, in progress, completed)
  String contactInfo; // Contact information

  DevelopmentProjectModel({
    this.id,
    required this.projectName,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.description,
    required this.status,
    required this.contactInfo,
  });

  Map<String, dynamic> toJson() {
    return {
      "projectName": projectName,
      "startDate": Timestamp.fromDate(startDate), // Store as Timestamp
      "endDate": Timestamp.fromDate(endDate), // Store as Timestamp
      "location": location,
      "description": description,
      "status": status,
      "contactInfo": contactInfo,
    };
  }

  factory DevelopmentProjectModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    // Handle case where startDate and endDate might be stored as Strings
    DateTime startDate;
    DateTime endDate;
    if (data["startDate"] is Timestamp) {
      startDate = (data["startDate"] as Timestamp).toDate();
    } else {
      startDate = DateTime.parse(data["startDate"]);
    }

    if (data["endDate"] is Timestamp) {
      endDate = (data["endDate"] as Timestamp).toDate();
    } else {
      endDate = DateTime.parse(data["endDate"]);
    }

    return DevelopmentProjectModel(
      id: doc.id,
      projectName: data["projectName"],
      startDate: startDate, // Convert from Timestamp
      endDate: endDate, // Convert from Timestamp
      location: data["location"],
      description: data["description"],
      status: data["status"],
      contactInfo: data["contactInfo"],
    );
  }
}
