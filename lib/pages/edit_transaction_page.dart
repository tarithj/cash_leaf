import 'package:cash_leaf/components/transaction_editor.dart';
import 'package:cash_leaf/storage/account/record.dart';
import 'package:flutter/material.dart';

class EditTransactionPage extends StatefulWidget {
  const EditTransactionPage(
      {Key? key, required this.record, required this.onDone})
      : super(key: key);

  final Record record;
  final void Function(Record) onDone;

  @override
  State<EditTransactionPage> createState() => _EditTransactionPageState();
}

class _EditTransactionPageState extends State<EditTransactionPage> {
  late Record stateRecord;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    stateRecord = widget.record;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Transactions"),
          actions: [
            IconButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    widget.onDone(stateRecord);
                  }
                },
                icon: const Icon(Icons.save))
          ],
        ),
        body: getBody(context));
  }

  Widget getBody(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      Container(
          padding: const EdgeInsets.only(top: 10, left: 2, right: 2),
          child: TransactionEditor(
              srcRecord: widget.record,
              onChange: (Record r) {
                stateRecord = r;
              },
              formKey: formKey)),
    ]));
  }
}
