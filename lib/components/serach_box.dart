import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key, required this.onChange}) : super(key: key);

  final void Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      onChanged: onChange,
      decoration: const InputDecoration(
        icon: Icon(Icons.search, color: Colors.white60),
        border: OutlineInputBorder(),
        labelText: "Search for a transaction",
      ),
    );
  }
}
