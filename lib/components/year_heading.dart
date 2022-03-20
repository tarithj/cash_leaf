import 'package:flutter/material.dart';

class YearHeading extends StatelessWidget {
  const YearHeading({Key? key, required this.year}) : super(key: key);

  final String year;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: [
          Text(year,
              style:
              const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const Divider(),
        ],
      ),
    );
  }
}
