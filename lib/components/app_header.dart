import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({Key? key, required this.title, this.front, this.trailing, this.children}) : super(key: key);

  final String title;
  final Widget? trailing;
  final List<Widget>? children;
  final Widget? front;

  @override
  Widget build(BuildContext context) {
    List<Widget> leftWidgets = [];
    List<Widget> headWidgets = [];

    if (front != null) {leftWidgets.addAll([Padding(
      padding: const EdgeInsets.only(right: 10),
      child: front!,
    )]);}

    leftWidgets.add(
      Text(
        title,
        style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white
        ),
      ),
    );

    // add all the left widgets before the adding trailing ones
    headWidgets.add(Row(children: leftWidgets));
    if (trailing != null) {headWidgets.add(trailing!);}


    List<Widget> mainWidgets = [
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: headWidgets
      ),
      const SizedBox(height: 25),
    ];
    if (children != null) {
      mainWidgets.addAll(children!);
    }

    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.01),
                spreadRadius: 10,
                blurRadius: 3
            )
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top:60,
          bottom: 25,
          right: 20,
          left: 20,
        ),
        child: Column(
          children: mainWidgets,
        ),
      ),
    );
  }
}
