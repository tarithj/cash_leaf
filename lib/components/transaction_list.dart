import 'package:cash_leaf/components/month_heading.dart';
import 'package:cash_leaf/components/transaction.dart';
import 'package:cash_leaf/components/year_heading.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../pages/edit_transaction_page.dart';
import '../storage/account/account_model.dart';
import '../storage/account/record.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(
      {Key? key,
      required this.records,
      required this.currencySymbol,
      this.enableMonthHeading = true,
      this.enableYearHeading = true})
      : super(key: key);

  final List<Record> records;
  final String currencySymbol;

  final bool enableYearHeading;
  final bool enableMonthHeading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _getTransactionList(context: context),
    );
  }

  List<Widget> _getTransactionList({required BuildContext context}) {
    if (records.isEmpty) {
      return [];
    }
    records.sort(
        (a, b) => b.getCreatedDateTime().compareTo(a.getCreatedDateTime()));

    int lastYear = records[0].getCreatedDateTime().year;
    int lastMonth = records[0].getCreatedDateTime().month;

    List<Widget> recordItems = [];

    if (enableYearHeading) {
      recordItems.add(
        YearHeading(year: lastYear.toString()),
      );
    }
    if (enableMonthHeading) {
      recordItems.add(MonthHeading(
          month: DateFormat('MMMM').format(DateTime(0, lastMonth)).toString()));
    }

    for (var record in records) {
      if (enableYearHeading && lastYear != record.getCreatedDateTime().year) {
        lastYear = record.getCreatedDateTime().year;
        recordItems.add(YearHeading(year: lastYear.toString()));
      }
      if (enableMonthHeading &&
          lastMonth != record.getCreatedDateTime().month) {
        lastMonth = record.getCreatedDateTime().month;
        recordItems.add(MonthHeading(
            month: DateFormat('MMMM').format(DateTime(0, lastMonth))));
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
}
