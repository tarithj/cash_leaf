import 'package:flutter/material.dart';

class MonthHeading extends StatelessWidget {
  const MonthHeading({Key? key, required this.month}) : super(key: key);

  final String month;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Row(
        children: [
          Text(month,
              style:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
        ],
      ),
    );
  }
}
