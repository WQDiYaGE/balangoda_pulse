import 'package:flutter/material.dart';

class ServiceListing extends StatelessWidget {
  const ServiceListing({
    Key? key,
    required this.name,
    required this.categoryIcon,
    required this.description,
    required this.rating,
    required this.reviews,
    required this.distance,
    required this.isOpenNow,
  }) : super(key: key);

  final String name;
  final IconData categoryIcon;
  final String description;
  final double rating;
  final int reviews;
  final double distance;
  final bool isOpenNow;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Icon and Business Name
            Row(
              children: [
                Icon(categoryIcon, size: 40, color: Colors.blue),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.labelSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // Open Now Indicator
                if (isOpenNow)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      'Open Now',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            // Description
            Text(
              description,
              style: Theme.of(context).textTheme.bodyLarge,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            // Rating, Reviews, and Distance
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Ratings and Reviews
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow[700]),
                    const SizedBox(width: 5),
                    Text('$rating ($reviews reviews)'),
                  ],
                ),
                // Distance
                Text('$distance km away'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
