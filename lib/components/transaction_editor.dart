import 'package:cash_leaf/common/extensions/datetime.dart';
import 'package:cash_leaf/components/date_picker_button.dart';
import 'package:cash_leaf/components/time_picker_button.dart';
import 'package:cash_leaf/storage/account/record.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransactionEditor extends StatefulWidget {
  const TransactionEditor({Key? key, this.srcRecord, required this.onChange})
      : super(key: key);

  final Record? srcRecord;
  final void Function(Record) onChange;

  @override
  State<TransactionEditor> createState() => _TransactionEditorState();
}

class _TransactionEditorState extends State<TransactionEditor> {
  final _formKey = GlobalKey<FormState>();
  String value = "";
  late Record _record = Record.only();

  @override
  void initState() {
    super.initState();
    if (widget.srcRecord != null) {
      _record = widget.srcRecord!;
    }
    _record.createdTimestamp = (widget.srcRecord == null
        ? DateTime.now().millisecondsSinceEpoch
        : widget.srcRecord?.getCreatedDateTime().millisecondsSinceEpoch)!;
  }

  @override
  Widget build(BuildContext context) {
    return getForm();
  }

  Widget getForm() {
    var inputPadding = const EdgeInsets.all(3);

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 8),
        child: Column(
          children: [
            Container(
              padding: inputPadding,
              child: TextFormField(
                initialValue: _record.title,
                onChanged: (text) {
                  setState(() {
                    _record.title = text;
                  });
                  widget.onChange(_record);
                },
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "Please enter an title";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: "Title",
                ),
              ),
            ),
            Container(
              padding: inputPadding,
              child: TextFormField(
                initialValue: _record.amount.toString(),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]|\.')),
                ],
                keyboardType: const TextInputType.numberWithOptions(
                    signed: false, decimal: false),
                onChanged: (text) {
                  setState(() {
                    _record.amount = double.parse(text.isEmpty ? "0" : text);
                  });
                  widget.onChange(_record);
                },
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "Please enter an amount";
                  } else if (double.tryParse(text) == null) {
                    return "Please enter an amount using only [0-9]";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: "Amount",
                ),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              padding: inputPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DatePickerButton(
                      selectedDate: _record.getCreatedDateTime(),
                      onSelect: (date) {
                        setState(() {
                          _record.createdTimestamp =
                              date.millisecondsSinceEpoch;
                        });
                        widget.onChange(_record);
                      }),
                  TimePickerButton(
                      selectedTime: _record.getCreatedDateTime(),
                      onSelect: (time) {
                        setState(() {
                          _record.createdTimestamp = _record
                              .getCreatedDateTime()
                              .setTimeOfDay(time)
                              .millisecondsSinceEpoch;
                        });
                        widget.onChange(_record);
                      })
                ],
              ),
            ),
            const SizedBox(height: 25),
            Container(
              padding: inputPadding,
              child: TextFormField(
                initialValue: _record.note,
                onChanged: (text) {
                  setState(() {
                    _record.note = text;
                  });
                  widget.onChange(_record);
                },
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  labelText: "Note",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
