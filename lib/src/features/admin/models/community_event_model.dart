import 'package:cloud_firestore/cloud_firestore.dart';

class CommunityEventModel {
  String? id;
  String name;
  DateTime dateTime;
  String location; // Localization with map integration
  String description;
  String organizer;
  String? rsvpDetails; // RSVP or registration details (if applicable)
  List<String>? eventImages; // Event images or flyers

  CommunityEventModel({
    this.id,
    required this.name,
    required this.dateTime,
    required this.location,
    required this.description,
    required this.organizer,
    this.rsvpDetails,
    this.eventImages,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "dateTime": Timestamp.fromDate(dateTime), // Store as Timestamp
      "location": location,
      "description": description,
      "organizer": organizer,
      "rsvpDetails": rsvpDetails,
      "eventImages": eventImages,
    };
  }

  factory CommunityEventModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    // Handle case where dateTime might be stored as a String
    DateTime dateTime;
    if(data["dateTime"] is Timestamp) {
      dateTime = (data["dateTime"] as Timestamp).toDate();
    } else {
      dateTime = DateTime.parse(data["dateTime"]);
    }

    return CommunityEventModel(
      id: doc.id,
      name: data["name"],
      dateTime: dateTime, // Convert from Timestamp
      location: data["location"],
      description: data["description"],
      organizer: data["organizer"],
      rsvpDetails: data["rsvpDetails"],
      eventImages: data["eventImages"] != null ? List<String>.from(data["eventImages"]) : null,
    );
  }
}
