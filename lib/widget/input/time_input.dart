import 'package:flutter/material.dart';
import 'package:toeic_app/common/extension/extension.dart';
import 'input.dart';
import 'input_type.dart';

class TimeInput extends StatefulWidget {
  final TimeOfDay? dateTime;
  final ValueChanged<TimeOfDay> onChanged;
  final bool isEnable;

  const TimeInput({
    super.key,
    required this.dateTime,
    required this.onChanged,
    this.isEnable = true,
  });

  @override
  State<TimeInput> createState() => _TimeInputState();
}

class _TimeInputState extends State<TimeInput> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _formatTime(widget.dateTime));
  }

  String _formatTime(TimeOfDay? timeOfDay) {
    if (timeOfDay == null) return '';
    final hour = timeOfDay.hour.toString().padLeft(2, '0');
    final minute = timeOfDay.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: widget.dateTime ?? TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: context.color.primary,
              onPrimary: context.color.white,
              onSurface: context.color.neutral,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: context.color.primary,
              ),
            ),
          ),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child!,
          ),
        );
      },
    );
    if (picked != null && picked != widget.dateTime) {
      _controller.text = _formatTime(picked);
      widget.onChanged(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.isEnable) {
          _selectTime(context);
        }
      },
      child: SizedBox(
        child: Input.raw(
          controller: _controller,
          inputType: InputType.text(),
          isEnable: false,
          suffixIcon: const Icon(Icons.access_time),
          fillColor: widget.isEnable
              ? context.color.white
              : context.color.neutral.shade50,
        ),
      ),
    );
  }
}
