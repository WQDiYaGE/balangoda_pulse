import 'package:cloud_firestore/cloud_firestore.dart';

class LocalNewsModel {
  String? id;
  String headline;
  DateTime publicationDate;
  String summary;
  String embeddedArticle;
  List<String>? relatedMedia; // Related images or videos
  String source;

  LocalNewsModel({
    this.id,
    required this.headline,
    required this.publicationDate,
    required this.summary,
    required this.embeddedArticle,
    this.relatedMedia,
    required this.source,
  });

  Map<String, dynamic> toJson() {
    return {
      "headline": headline,
      "publicationDate": Timestamp.fromDate(publicationDate), // Store as Timestamp
      "summary": summary,
      "embeddedArticle": embeddedArticle,
      "relatedMedia": relatedMedia,
      "source": source,
    };
  }

  factory LocalNewsModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    // Handle case where publicationDate might be stored as a String
    DateTime publicationDate;
    if(data["publicationDate"] is Timestamp) {
      publicationDate = (data["publicationDate"] as Timestamp).toDate();
    } else {
      publicationDate = DateTime.parse(data["publicationDate"]);
    }

    return LocalNewsModel(
      id: doc.id,
      headline: data["headline"],
      publicationDate: publicationDate, // Convert from Timestamp
      summary: data["summary"],
      embeddedArticle: data["embeddedArticle"],
      relatedMedia: data["relatedMedia"] != null ? List<String>.from(data["relatedMedia"]) : null,
      source: data["source"]
    );
  }
}
