import 'package:cash_leaf/components/serach_box.dart';
import 'package:cash_leaf/components/transaction.dart';
import 'package:cash_leaf/components/transaction_list.dart';
import 'package:cash_leaf/pages/edit_transaction_page.dart';
import 'package:cash_leaf/storage/account/account_model.dart';
import 'package:cash_leaf/storage/account/record.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: getBody(),
    );
  }

  String query = "";

  Widget getBody() {
    var padding = const EdgeInsets.only(top: 3, left: 20, right: 20);
    return SingleChildScrollView(
      padding: padding,
      child: Column(
        children: [
          SearchBox(onChange: (text) {
            setState(() {
              query = text;
            });
          }),
          const SizedBox(height: 20),
          Consumer<AccountModel>(builder: (context, account, child) {
            List<Record> records = [];
            if (query == "") {
              records = account.records;
            } else {
              records =
                  account.getRecordsWithTitleContainsString(query).toList();
            }

            var transactions = TransactionList(
                records: records, currencySymbol: account.currencySuffix);
            return Column(children: [transactions]);
          })
        ],
      ),
    );
  }

  List<Widget> getTransactionList(
      {required List<Record> records, required String currencySymbol}) {
    if (records.isEmpty) {
      return [];
    }
    records.sort(
        (a, b) => b.getCreatedDateTime().compareTo(a.getCreatedDateTime()));

    int lastYear = records[0].getCreatedDateTime().year;
    int lastMonth = records[0].getCreatedDateTime().month;

    List<Widget> recordItems = [];

    recordItems.addAll([
      _getYearHeading(lastYear),
      _getMonthHeading(
          DateFormat('MMMM').format(DateTime(0, lastMonth)).toString())
    ]);

    for (var record in records) {
      if (lastYear != record.getCreatedDateTime().year) {
        lastYear = record.getCreatedDateTime().year;
        recordItems.add(_getYearHeading(lastYear));
      }
      if (lastMonth != record.getCreatedDateTime().month) {
        lastMonth = record.getCreatedDateTime().year;
        recordItems.add(_getMonthHeading(
            DateFormat('MMMM').format(DateTime(0, lastMonth))));
      }

      recordItems.add(Transaction(
        record: record,
        currencySymbol: currencySymbol,
        icon: Icons.timer,
        onSelectOption: (TransactionMenuItems action) {
          final account = Provider.of<AccountModel>(context, listen: false);

          switch (action) {
            case TransactionMenuItems.delete:
              var dialog = showDialog<String>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text(
                          "Are you sure you want to delete this transaction?"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Delete'),
                          child: const Text('Delete'),
                        ),
                      ],
                    );
                  });
              dialog.then((value) {
                if (value == "Delete") {
                  account.removeRecord(record.id);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Removed Transaction'),
                  ));
                }
              });
              break;
            case TransactionMenuItems.edit:
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return EditTransactionPage(
                    record: record,
                    onDone: (Record newRecord) {
                      account.removeRecord(record.id);
                      account.addRecord(newRecord);
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Updated Transaction'),
                      ));
                    });
              }));
              break;
          }
        },
      ));
    }

    return recordItems;
  }

  Widget _getYearHeading(int year) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: [
          Text("$year",
              style:
                  const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const Divider(),
        ],
      ),
    );
  }

  Widget _getMonthHeading(String month) {
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
