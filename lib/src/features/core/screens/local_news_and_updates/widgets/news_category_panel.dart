import 'package:flutter/material.dart';

class NewsCategoryPanelWidget extends StatelessWidget {
  const NewsCategoryPanelWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap
  });

  final String title, subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: color,
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8.0,
                    offset: Offset(0, 2)
                )
              ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, size: 50, color: Colors.white),
              const SizedBox(height: 10.0),
              Text(
                  title,
                  style: const TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center
              ),
              const SizedBox(height: 5.0),
              Text(
                  subtitle,
                  style: const TextStyle(fontSize: 15.0, color: Colors.white70, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center
              )
            ],
          ),
        ),
      ),
    );
  }
}