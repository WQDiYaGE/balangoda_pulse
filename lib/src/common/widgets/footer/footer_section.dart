import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import 'footer_link.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Quick Links
        Text(
          'Quick Links',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: CustomSizes.defaultSpace),
        Wrap(
          spacing: CustomSizes.defaultSpace,
          runSpacing: CustomSizes.defaultSpace,
          children: [
            FooterLink(text: 'Community Forums', url: '#'),
            FooterLink(text: 'Local Services', url: '#'),
            FooterLink(text: 'Events', url: '#'),
            FooterLink(text: 'Emergency Alerts', url: '#'),
            FooterLink(text: 'Issue Reporting', url: '#'),
          ],
        ),
        SizedBox(height: CustomSizes.spaceBetweenSections),

        // Contact Information
        Text(
          'Contact Information',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: CustomSizes.defaultSpace),
        Text('Urban Council Balangoda'),
        SizedBox(height: CustomSizes.small),
        Text('+94 45 49 30 830'),
        SizedBox(height: CustomSizes.small),
        Text('info@balangoda.uc.gov.lk'),
        SizedBox(height: CustomSizes.spaceBetweenSections),
      ],
    );
  }
}

