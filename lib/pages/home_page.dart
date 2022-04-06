import 'package:cash_leaf/components/transaction_list.dart';
import 'package:cash_leaf/pages/new_transaction_page.dart';
import 'package:cash_leaf/storage/account/record.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/money_display.dart';
import '../storage/account/account_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    const actionIconPadding = EdgeInsets.all(12);
    return Scaffold(
      appBar: AppBar(actions: [
        Padding(
          padding: actionIconPadding,
          child: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return NewTransactionPage(onDone: (Record r) {
                    final account =
                        Provider.of<AccountModel>(context, listen: false);
                    account.addRecord(r);
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Created Transaction'),
                    ));
                  });
                }));
              },
              icon: const Icon(Icons.add)),
        )
      ]),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.2,
            child: Center(child:
                Consumer<AccountModel>(builder: (context, account, child) {
              return MoneyDisplay(
                  value: account.getSumOfTransactionOnWeek(DateTime.now()),
                  symbol: account.currencySuffix);
            })),
          ),
          Consumer<AccountModel>(builder: (context, account, child) {
            return TransactionList(
              records: account.getRecordsOnWeek(DateTime.now()).toList(),
              currencySymbol: account.currencySuffix,
              enableMonthHeading: false,
              enableYearHeading: false,
            );
          })
        ],
      ),
    );
  }
}
