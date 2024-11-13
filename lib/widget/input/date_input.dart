import 'package:flutter/material.dart';
import 'package:toeic_app/common/extension/extension.dart';
import 'input.dart';
import 'input_type.dart';

class DateInput extends StatefulWidget {
  final DateTime? dateTime;
  final ValueChanged<DateTime> onChanged;
  final bool isEnable;

  const DateInput(
      {super.key,
        required this.dateTime,
        required this.onChanged,
        this.isEnable = true});

  @override
  State<DateInput> createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _formatDate(widget.dateTime));
  }

  String _formatDate(DateTime? dateTime) {
    return dateTime == null ? '' : mMMddyyyyFormatter.format(dateTime);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime initialDate = widget.dateTime ?? DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900, 8),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: context.color.primary, // <-- SEE HERE
              onPrimary: context.color.white, // <-- SEE HERE
              onSurface: context.color.neutral, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: context.color.primary, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != widget.dateTime) {
      _controller.text = _formatDate(picked);
      widget.onChanged(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isEnable ? () => _selectDate(context) : null,
      child: SizedBox(
          child: Input.raw(
            controller: _controller,
            inputType: InputType.text(),
            isEnable: false,
            suffixIcon: const Icon(Icons.calendar_month),
            fillColor: (widget.isEnable)
                ? context.color.white
                : context.color.neutral.shade50,
          )),
    );
  }
}
