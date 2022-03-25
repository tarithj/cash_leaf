import 'package:cash_leaf/common/extensions/datetime.dart';
import 'package:cash_leaf/components/date_picker_button.dart';
import 'package:cash_leaf/components/time_picker_button.dart';
import 'package:cash_leaf/components/title_card.dart';
import 'package:cash_leaf/storage/account/record.dart';
import 'package:flutter/material.dart';

class TransactionEditor extends StatefulWidget {
  const TransactionEditor(
      {Key? key,
      required this.onDone,
      this.srcRecord,
      required this.submitButtonText})
      : super(key: key);

  final void Function(Record) onDone;
  final Record? srcRecord;
  final String submitButtonText;

  @override
  State<TransactionEditor> createState() => _TransactionEditorState();
}

class _TransactionEditorState extends State<TransactionEditor> {
  final _formKey = GlobalKey<FormState>();
  DateTime _selectedDateTime = DateTime.now();
  String value = "";
  late Record _record = Record.only();

  @override
  void initState() {
    super.initState();
    if (widget.srcRecord != null) {
      _record = widget.srcRecord!;
      _selectedDateTime = (widget.srcRecord == null
          ? DateTime.now()
          : widget.srcRecord?.getCreatedDateTime())!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return getForm();
  }

  Widget getBasicInfoCard() {
    const inputPadding =
        EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25);

    return TitleCard(
      title: "Basic Info",
      children: [
        Container(
          padding: inputPadding,
          child: TextFormField(
            initialValue: _record.title,
            onChanged: (text) {
              _record.title = text;
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
            keyboardType: TextInputType.number,
            onChanged: (text) {
              value = text;
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
        Container(
          padding: inputPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DatePickerButton(
                  selectedDate: _selectedDateTime,
                  onSelect: (date) {
                    setState(() {
                      _selectedDateTime = date;
                    });
                  }),
              TimePickerButton(
                  selectedTime: _selectedDateTime,
                  onSelect: (time) {
                    setState(() {
                      _selectedDateTime = _selectedDateTime.setTimeOfDay(time);
                    });
                  })
            ],
          ),
        ),
      ],
    );
  }

  Widget getOptionalInfoCard() {
    const inputPadding =
        EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25);

    return TitleCard(
      title: "Optional Info",
      children: [
        Container(
          padding: inputPadding,
          child: TextFormField(
            initialValue: _record.note,
            onChanged: (text) {
              _record.note = text;
            },
            decoration: const InputDecoration(
              labelText: "Note",
            ),
          ),
        )
      ],
    );
  }

  Widget getForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          getBasicInfoCard(),
          const SizedBox(height: 25),
          getOptionalInfoCard(),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
              if (_formKey.currentState!.validate()) {
                _record.createdTimestamp =
                    _selectedDateTime.millisecondsSinceEpoch;

                if (value.isNotEmpty) {
                  _record.amount = double.parse(value);
                }
                widget.onDone(_record);
              }
            },
            child: Text(widget.submitButtonText),
          ),
          const SizedBox(height: 50)
        ],
      ),
    );
  }
}
