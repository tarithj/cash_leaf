import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../storage/account/record.dart';

enum TransactionModalBottomSheetItems {
  delete
}

class TransactionModalBottomSheet extends StatelessWidget {
  const TransactionModalBottomSheet({Key? key, required this.record, required this.currencySuffix, required this.onDeletePressed, required this.onEditPressed}) : super(key: key);

  final Record record;
  final String currencySuffix;

  final void Function() onEditPressed;
  final void Function() onDeletePressed;


  List<PopupMenuEntry> _getPopupMenuItems(BuildContext context) {
    return <PopupMenuEntry<TransactionModalBottomSheetItems>> [
      PopupMenuItem<TransactionModalBottomSheetItems>(
        value: TransactionModalBottomSheetItems.delete,
        child: Row(
          children: const [
            Icon(Icons.delete_forever),
            SizedBox(width: 10),
            Text('Delete'),
          ],
        ),
      ),
    ];
  }

  Widget _getTransactionHeading(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(DateFormat("EEE yyyy/MM/dd hh:m").format(record.getCreatedDateTime()), style: Theme.of(context).textTheme.overline),
            const SizedBox(height: 5),
            Text(record.title, style: Theme.of(context).textTheme.headline3)
          ],
        ),
        Row(
          children: [
            IconButton(onPressed: onEditPressed, icon: const Icon(Icons.edit)),
            PopupMenuButton(onSelected: (selected){
              switch (selected) {
                case TransactionModalBottomSheetItems.delete:
                  onDeletePressed();
              }
            }, itemBuilder: _getPopupMenuItems, icon: const Icon(Icons.more_vert))
          ],
        )
      ]
    );
  }


  Widget? _getNote(BuildContext context) {
    if (record.note.isEmpty) {return null;}
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Note", style: Theme.of(context).textTheme.caption),
        Text(record.note, style: Theme.of(context).textTheme.bodyText2)
      ],
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 20),
        child: Column(
          children: [
            _getTransactionHeading(context),
            const SizedBox(height: 30),
            Center(
              child: Text("${record.getEffectSign()} ${record.amount.toString()} $currencySuffix", style:  Theme.of(context).textTheme.displaySmall),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              alignment: Alignment.centerLeft,
              child: _getNote(context)
            ),
          ]
        ),
      ),
    );
  }
}
