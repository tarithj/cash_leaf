import 'package:cash_leaf/components/transaction_editor.dart';
import 'package:cash_leaf/storage/account/record.dart';
import 'package:flutter/material.dart';

class EditTransactionPage extends StatelessWidget {
  const EditTransactionPage({Key? key, required this.record, required this.onDone}) : super(key: key);

  final Record record;
  final void Function(Record) onDone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Transactions"),
        ),
        body: getBody(context)
    );
  }

  Widget getBody(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.only(top: 10, left: 2, right: 2),
                  child: TransactionEditor(submitButtonText: "Update", srcRecord: record, onDone: onDone)
              )
            ]
        )
    );
  }
}
