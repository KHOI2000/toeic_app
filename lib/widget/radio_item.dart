import 'package:flutter/material.dart';
import 'package:toeic_app/common/extension/extension.dart';

class RadioItem<T> extends StatelessWidget {
  final T groupValue;
  final ValueChanged<T?>? onChanged;
  final T value;

  const RadioItem(
      {super.key,
        required this.groupValue,
        required this.onChanged,
        required this.value});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        //here change to your color
        unselectedWidgetColor: context.color.neutral.shade400,
      ),
      child: Radio<T>(
        visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity,
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        value: value,
        activeColor: context.color.primary,
        onChanged: onChanged,
        groupValue: groupValue,
      ),
    );
  }
}
