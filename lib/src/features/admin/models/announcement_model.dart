import 'package:cloud_firestore/cloud_firestore.dart';

class AnnouncementModel {
  String? id;
  String title;
  DateTime dateTime;
  String description;
  List<String>? images; // List of image URLs or attachment links
  String? moreDetailsLink; // Link to more detailed information
  String? contactInfo; // Contact information for further inquiries

  AnnouncementModel({
    this.id,
    required this.title,
    required this.dateTime,
    required this.description,
    this.images,
    this.moreDetailsLink,
    this.contactInfo,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "dateTime": Timestamp.fromDate(dateTime), // Store as Timestamp
      "description": description,
      "images": images,
      "moreDetailsLink": moreDetailsLink,
      "contactInfo": contactInfo,
    };
  }

  factory AnnouncementModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    // Handle case where dateTime might be stored as a String
    DateTime dateTime;
    if(data["dateTime"] is Timestamp) {
      dateTime = (data["dateTime"] as Timestamp).toDate();
    } else {
      dateTime = DateTime.parse(data["dateTime"]);
    }

    return AnnouncementModel(
      id: snapshot.id,
      title: data["title"],
      dateTime: dateTime, // Convert from Timestamp
      description: data["description"],
      images: data["images"] != null ? List<String>.from(data["images"]) : null,
      moreDetailsLink: data["moreDetailsLink"],
      contactInfo: data["contactInfo"],
    );
  }
}
