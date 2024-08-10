import 'package:cloud_firestore/cloud_firestore.dart';

class CommunitySpotlightModel {
  String? id;
  String name;
  DateTime date;
  String description;
  List<String>? media; // Images or videos showcasing their work
  List<String>? testimonials; // Testimonials or quotes
  String? contactInfo; // Contact information

  CommunitySpotlightModel({
    this.id,
    required this.name,
    required this.date,
    required this.description,
    this.media,
    this.testimonials,
    this.contactInfo,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "date": Timestamp.fromDate(date), // Store as Timestamp
      "description": description,
      "media": media,
      "testimonials": testimonials,
      "contactInfo": contactInfo,
    };
  }

  factory CommunitySpotlightModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    // Handle case where date might be stored as a String
    DateTime date;
    if (data["date"] is Timestamp) {
      date = (data["date"] as Timestamp).toDate();
    } else {
      date = DateTime.parse(data["date"]);
    }

    return CommunitySpotlightModel(
      id: doc.id,
      name: data["name"],
      date: date, // Convert from Timestamp
      description: data["description"],
      media: data["media"] != null ? List<String>.from(data["media"]) : null,
      testimonials: data["testimonials"] != null ? List<String>.from(data["testimonials"]) : null,
      contactInfo: data["contactInfo"],
    );
  }
}
