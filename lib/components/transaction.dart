
import 'package:cash_leaf/storage/account/account_model.dart';
import 'package:cash_leaf/storage/account/record.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:cash_leaf/components/transaction_model_bottom_sheet.dart';

enum TransactionMenuItems {
  delete,
  edit
}


class Transaction extends StatelessWidget {
  const Transaction({Key? key, required this.onSelectOption, required this.record, required this.currencySymbol, required this.icon}) : super(key: key);

  final Record record;
  final String currencySymbol;
  final IconData icon;
  final Function(TransactionMenuItems) onSelectOption;

  @override
  Widget build(BuildContext context) {

    var creationDateDifference = DateTime.now().difference(record.getCreatedDateTime());
    var currencySuffix = Provider.of<AccountModel>(context).currencySuffix;

    return Card(
      child: ListTile(
        onTap: () {
          showModalBottomSheet(context: context,
            builder: (context) {
              return TransactionModalBottomSheet(
                record: record,
                currencySuffix: currencySuffix,
                onEditPressed: (){Navigator.pop(context);onSelectOption(TransactionMenuItems.edit);},
                onDeletePressed: (){Navigator.pop(context);onSelectOption(TransactionMenuItems.delete);},
              );
            }
          );

        },
        title: Text(record.title),
        subtitle: Text(timeago.format(DateTime.now().subtract(creationDateDifference))),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${record.getEffectSign()} ${record.amount.toString()} $currencySymbol",
              style: const TextStyle(
                  fontSize:20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white
              ),
            ),
          ],
        ),
      ),
    );
  }
}
