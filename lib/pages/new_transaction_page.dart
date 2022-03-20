import 'package:cash_leaf/components/transaction_editor.dart';
import 'package:cash_leaf/storage/account/account_model.dart';
import 'package:cash_leaf/storage/account/record.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewTransactionPage extends StatelessWidget {
  const NewTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("New Transactions"),
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
                  child: TransactionEditor(submitButtonText: "Add", onDone: (Record record) {
                    Provider.of<AccountModel>(context, listen: false).addRecord(
                        record
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Added Transaction'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  })
              )
            ]
        )
    );
  }
}
