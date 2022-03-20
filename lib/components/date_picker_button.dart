import 'package:flutter/material.dart';

class DatePickerButton extends StatelessWidget {
  const DatePickerButton({Key? key, required this.selectedDate, required this.onSelect}) : super(key: key);

  final DateTime selectedDate;
  final void Function(DateTime) onSelect;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.1)),
      ),
      onPressed: (){_showDatePicker(context);},
      child: Row(
        children: [
          const Icon(Icons.calendar_month),
          const SizedBox(width: 10),
          Text(
            "${selectedDate.year}/${selectedDate.month}/${selectedDate.day}",
            style: const TextStyle(
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2015, 8), lastDate: DateTime(2101));
    if(picked != null)
    {
      onSelect(picked);
    }
  }
}
