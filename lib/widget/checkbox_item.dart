import 'package:flutter/material.dart';
import 'package:toeic_app/common/extension/extension.dart';

class CheckboxItem extends StatelessWidget {
  final ValueChanged<bool> onChanged;
  final bool value;
  final String text;

  const CheckboxItem(
      {super.key,
        required this.onChanged,
        required this.value,
        required this.text});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          side: BorderSide(color: context.color.neutral.shade600),
          value: value,
          onChanged: (value) {
            if (value != null) {
              onChanged(value);
            }
          },
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: context.theme.textThemeNeutralFaded.s14,
        )
      ],
    );
  }
}
