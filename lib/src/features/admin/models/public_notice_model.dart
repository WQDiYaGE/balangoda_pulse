import 'package:cloud_firestore/cloud_firestore.dart';

class PublicNoticeModel {
  String? id;
  String title;
  DateTime dateTime;
  String description;
  List<DateTime>? relevantDates; // Relevant dates and deadlines (if any)
  List<String>? attachments; // Attachments or links to official documents
  String? contactInfo; // Contact information for more details

  PublicNoticeModel({
    this.id,
    required this.title,
    required this.dateTime,
    required this.description,
    this.relevantDates,
    this.attachments,
    this.contactInfo,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "dateTime": Timestamp.fromDate(dateTime), // Store as Timestamp
      "description": description,
      "relevantDates": relevantDates?.map((date) => Timestamp.fromDate(date)).toList(),
      "attachments": attachments,
      "contactInfo": contactInfo,
    };
  }

  factory PublicNoticeModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    // Handle case where dateTime might be stored as a String
    DateTime dateTime;
    if(data["dateTime"] is Timestamp) {
      dateTime = (data["dateTime"] as Timestamp).toDate();
    } else {
      dateTime = DateTime.parse(data["dateTime"]);
    }

    List<DateTime>? relevantDates;
    if (data["relevantDates"] != null) {
      relevantDates = (data["relevantDates"] as List)
          .map((timestamp) => (timestamp as Timestamp).toDate())
          .toList();
    }

    return PublicNoticeModel(
      id: doc.id,
      title: data["title"],
      dateTime: dateTime, // Convert from Timestamp
      description: data["description"],
      relevantDates: relevantDates,
      attachments: data["attachments"] != null ? List<String>.from(data["attachments"]) : null,
      contactInfo: data["contactInfo"],
    );
  }
}
