import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../utils/constants/sizes.dart';
import 'event_update_card.dart';

class EventsUpdatesSection extends StatelessWidget {
  const EventsUpdatesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 232, // Adjust the height as needed
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('EventsUpdates').snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData) {
            return const Center(
                child: CircularProgressIndicator()
            );
          }
          var eventsUpdates = snapshot.data!.docs.map((doc) {
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

            return EventUpdateCard(
              title: doc['title'],
              description: doc['summary'],
              date: formattedDate,
              readMoreUrl: '#',
            );
          }).toList();
          return ListView.builder(
            shrinkWrap: true,
            itemCount: eventsUpdates.length, // Number of events & updates
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return Padding(
                  padding: const EdgeInsets.only(right: CustomSizes.defaultSpace),
                  child: eventsUpdates[index]
              );
            },
          );
        }
      ),
    );
  }
}
