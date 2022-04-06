import 'package:cash_leaf/components/transaction_editor.dart';
import 'package:cash_leaf/storage/account/record.dart';
import 'package:flutter/material.dart';

class NewTransactionPage extends StatefulWidget {
  const NewTransactionPage({Key? key, required this.onDone}) : super(key: key);

  final void Function(Record) onDone;

  @override
  State<NewTransactionPage> createState() => _NewTransactionPageState();
}

class _NewTransactionPageState extends State<NewTransactionPage> {
  Record stateRecord = Record.only();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Transactions"),
        actions: [
          IconButton(
              onPressed: () {
                widget.onDone(stateRecord);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: getBody(context),
    );
  }

  Widget getBody(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      Container(
          padding: const EdgeInsets.only(top: 10, left: 2, right: 2),
          child: TransactionEditor(onChange: (Record record) {
            stateRecord = record;
          }))
    ]));
  }
}
