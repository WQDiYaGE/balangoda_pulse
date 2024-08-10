import 'package:balangoda_pulse/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(border: Border(left: BorderSide(width: 4))),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(dashboardSearch, style: Theme.of(context).textTheme.titleSmall?.apply(color: Colors.grey.withOpacity(0.5))),
              const Icon(Icons.mic, size: 25)
            ]
        )
    );
  }
}