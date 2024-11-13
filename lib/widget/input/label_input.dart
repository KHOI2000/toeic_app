import 'package:flutter/material.dart';
import 'package:toeic_app/common/extension/extension.dart';
import 'input.dart';
import 'input_type.dart';

class LabelInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final InputType inputType;
  final bool isEnable;
  final bool isRequired;
  final bool obscure;
  final int maxLine;

  LabelInput(
      {super.key,
        required this.label,
        required this.controller,
        inputType,
        this.isEnable = true,
        this.isRequired = true,
        this.obscure = false,
        this.maxLine = 1})
      : inputType = inputType ?? InputType.text();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: context.theme.textThemeNeutral.s14.semiBold,
            ),
            (isRequired)
                ? Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                '*',
                style: context.theme.textThemePrimary.s14,
              ),
            )
                : const SizedBox()
          ],
        ),
        const SizedBox(height: 8),
        Input.raw(
          controller: controller,
          autofocus: false,
          inputType: inputType,
          isEnable: isEnable,
          obscure: obscure,
          maxLine: maxLine,
        )
      ],
    );
  }
}
