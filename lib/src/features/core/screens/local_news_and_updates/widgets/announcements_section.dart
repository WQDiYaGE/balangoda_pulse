import 'package:balangoda_pulse/src/utils/constants/sizes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'announcement_card.dart'; // Import the AnnouncementCard widget

class AnnouncementsSection extends StatelessWidget {
  const AnnouncementsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300, // Adjust the height as needed
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Announcements').snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator()
            );
          }
          var announcements = snapshot.data!.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            DateTime dateTime;

            if (data['dateTime'] is Timestamp) {
              dateTime = (data['dateTime'] as Timestamp).toDate();
            } else if (data['dateTime'] is String) {
              dateTime = DateTime.parse(data['dateTime']);
            } else {
              dateTime = DateTime.now(); // default fallback
            }

            // Format the date to show only the date
            final formattedDate = DateFormat.yMMMMd().format(dateTime);

            return AnnouncementCard(
              title: doc['title'],
              description: doc['description'],
              date: formattedDate,
              readMoreUrl: '#',
            );
          }).toList();
          return ListView.builder(
            shrinkWrap: true,
            itemCount: announcements.length, // Number of announcements
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(right: CustomSizes.spaceBetweenSections),
                child: announcements[index]
              );
            }
          );
        },
      )
    );
  }
}
