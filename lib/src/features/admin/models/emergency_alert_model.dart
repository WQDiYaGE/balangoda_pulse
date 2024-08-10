import 'package:cloud_firestore/cloud_firestore.dart';

class EmergencyAlertModel {
  String? id;
  String type;
  DateTime dateTime;
  String urgencyLevel;
  String detailedInformation;
  String instructions;
  String contactDetails;

  EmergencyAlertModel({
    this.id,
    required this.type,
    required this.dateTime,
    required this.urgencyLevel,
    required this.detailedInformation,
    required this.instructions,
    required this.contactDetails,
  });

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "dateTime": Timestamp.fromDate(dateTime), // Store as Timestamp
      "urgencyLevel": urgencyLevel,
      "detailedInformation": detailedInformation,
      "instructions": instructions,
      "contactDetails": contactDetails,
    };
  }

  factory EmergencyAlertModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    // Handle case where dateTime might be stored as a String
    DateTime dateTime;
    if(data["dateTime"] is Timestamp) {
      dateTime = (data["dateTime"] as Timestamp).toDate();
    } else {
      dateTime = DateTime.parse(data["dateTime"]);
    }

    return EmergencyAlertModel(
      id: doc.id,
      type: data["type"],
      dateTime: dateTime, // Convert from Timestamp
      urgencyLevel: data["urgencyLevel"],
      detailedInformation: data["detailedInformation"],
      instructions: data["instructions"],
      contactDetails: data["contactDetails"],
    );
  }
}
