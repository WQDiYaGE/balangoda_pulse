import 'package:cloud_firestore/cloud_firestore.dart';

class CulturalAndLifestyleModel {
  String? id;
  String title;
  DateTime dateTime;
  String description;
  List<String>? relatedMedia; // Related images or videos
  String? moreInfoLink; // Links to more information or related events
  String organizer;

  CulturalAndLifestyleModel({
    this.id,
    required this.title,
    required this.dateTime,
    required this.description,
    this.relatedMedia,
    this.moreInfoLink,
    required this.organizer,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "dateTime": Timestamp.fromDate(dateTime), // Store as Timestamp
      "description": description,
      "relatedMedia": relatedMedia,
      "moreInfoLink": moreInfoLink,
      "organizer": organizer,
    };
  }

  factory CulturalAndLifestyleModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    // Handle case where dateTime might be stored as a String
    DateTime dateTime;
    if (data["dateTime"] is Timestamp) {
      dateTime = (data["dateTime"] as Timestamp).toDate();
    } else {
      dateTime = DateTime.parse(data["dateTime"]);
    }

    return CulturalAndLifestyleModel(
      id: doc.id,
      title: data["title"],
      dateTime: dateTime, // Convert from Timestamp
      description: data["description"],
      relatedMedia: data["relatedMedia"] != null ? List<String>.from(data["relatedMedia"]) : null,
      moreInfoLink: data["moreInfoLink"],
      organizer: data["organizer"],
    );
  }
}
