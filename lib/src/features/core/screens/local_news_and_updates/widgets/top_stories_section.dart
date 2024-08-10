import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import 'top_story_card.dart'; // Import the TopStoryCard widget

class TopStoriesSection extends StatelessWidget {
  const TopStoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 310, // Adjust the height as needed
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('TopStories').snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData) {
            return const Center(
                child: CircularProgressIndicator()
            );
          }

          var topStories = snapshot.data!.docs.map((doc) {
            return TopStoryCard(
              title: doc['title'],
              summary: doc['summary'],
              imageUrl: CustomImageStrings.underReview,
              readMoreUrl: '#',
            );
          }).toList();
          return ListView.builder(
            shrinkWrap: true,
            itemCount: topStories.length, // Number of top stories
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(right: CustomSizes.defaultSpace),
                child: topStories[index]
              );
            },
          );
        }
      ),
    );
  }
}
