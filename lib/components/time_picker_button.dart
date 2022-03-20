import 'package:flutter/material.dart';

class TimePickerButton extends StatelessWidget {
  const TimePickerButton({Key? key, required this.selectedTime, required this.onSelect}) : super(key: key);

  final DateTime selectedTime;
  final void Function(TimeOfDay) onSelect;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.1)),
      ),
      onPressed: () {
        _showTimePicker(context);
      },
      child: Row(
        children: [
          const Icon(Icons.schedule),
          const SizedBox(width: 10),
          Text(
            "${selectedTime.hour}:${selectedTime.minute}",
            style: const TextStyle(
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }


  Future<void> _showTimePicker(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(selectedTime));
    if (picked != null)
    {
      onSelect(picked);
    }
  }
}
