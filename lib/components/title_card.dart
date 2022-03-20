import 'package:flutter/material.dart';

class TitleCard extends StatelessWidget {
  const TitleCard({Key? key, required this.children, required this.title}) : super(key: key);

  final List<Widget> children;
  final String title;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
       Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20, top: 20),
        child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
      ),
    ];
    children.addAll(this.children);
    children.add(const SizedBox(height: 25));

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );

  }
}
