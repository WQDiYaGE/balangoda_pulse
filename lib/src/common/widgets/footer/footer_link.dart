import 'package:flutter/material.dart';

class FooterLink extends StatelessWidget {
  final String text;
  final String url;

  const FooterLink({super.key, required this.text, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle link tap
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: Theme.of(context).primaryColor,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}