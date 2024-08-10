import 'package:flutter/material.dart';

import 'metric_card.dart';

class MetricsSection extends StatelessWidget {
  const MetricsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 120.0, // Adjust the height as needed
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              MetricCard(title: 'Total Users', count: '1200', backgroundColor: Colors.blue[50]),
              MetricCard(title: 'Total News Articles', count: '300', backgroundColor: Colors.green[50]),
              MetricCard(title: 'Total Events', count: '150', backgroundColor: Colors.orange[50]),
              MetricCard(title: 'Active Alerts', count: '5', backgroundColor: Colors.red[50]),
              MetricCard(title: 'Reported Issues', count: '20', backgroundColor: Colors.purple[50]),
            ],
          )
        ),
      ],
    );
  }
}