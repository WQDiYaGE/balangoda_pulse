import 'package:balangoda_pulse/src/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class MetricCard extends StatelessWidget {
  const MetricCard({
    super.key,
    required this.title,
    required this.count,
    this.backgroundColor
  });

  final String title;
  final String count;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.medium),
          child: Column(
            children: <Widget>[
              Text(
                count,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600]
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}