import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toeic_app/common/extension/extension.dart';
import '../../app/res/images.dart';
import '../../di/locator_shorten.dart';
import 'input_type.dart';

class Input extends StatefulWidget {
  Input.raw(
      {super.key,
        required this.controller,
        this.autofocus = false,
        this.obscure = false,
        required this.inputType,
        this.hintText = '',
        this.prefixIcon,
        this.suffixIcon,
        this.isEnable = true,
        this.onChanged,
        this.onEditingComplete,
        this.decoration,
        this.maxLine = 1,
        this.maxLength,
        fillColor})
      : fillColor = (fillColor != null)
      ? fillColor
      : (isEnable ?? true)
      ? AppLocator.color.white
      : AppLocator.color.neutral.shade50;

  final TextEditingController controller;
  final bool autofocus;
  final bool obscure;
  final InputType inputType;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? isEnable;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final Color? fillColor;
  final int? maxLine;
  final int? maxLength;
  final InputDecoration? decoration;

  factory Input.text(
      {required TextEditingController controller,
        bool autofocus = false,
        String hintText = '',
        Widget? prefixIcon,
        Widget? suffixIcon,
        ValueChanged<String>? onChanged,
        VoidCallback? onEditingComplete,
        Color? fillColor,
        bool? isEnable,
        InputDecoration? decoration,
        int? maxLine}) =>
      Input.raw(
        controller: controller,
        autofocus: autofocus,
        inputType: InputType.text(),
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        fillColor: fillColor,
        isEnable: isEnable,
        maxLine: maxLine,
        decoration: decoration,
      );

  factory Input.number(
      {required TextEditingController controller,
        bool autofocus = false,
        String hintText = '',
        Widget? prefixIcon,
        Widget? suffixIcon,
        ValueChanged<String>? onChanged,
        Color? fillColor,
        int? maxLength,
        bool? isEnable}) =>
      Input.raw(
        controller: controller,
        autofocus: autofocus,
        inputType: InputType.number(),
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        onChanged: onChanged,
        fillColor: fillColor,
        isEnable: isEnable,
        maxLength: maxLength,
      );

  factory Input.double(
      {required TextEditingController controller,
        bool autofocus = false,
        String hintText = '',
        Widget? prefixIcon,
        Widget? suffixIcon,
        ValueChanged<String>? onChanged,
        Color? fillColor,
        bool? isEnable}) =>
      Input.raw(
        controller: controller,
        autofocus: autofocus,
        inputType: InputType.double(),
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        onChanged: onChanged,
        fillColor: fillColor,
        isEnable: isEnable,
      );

  factory Input.email(
      {required TextEditingController controller,
        bool autofocus = false,
        String hintText = '',
        Widget? prefixIcon,
        Widget? suffixIcon,
        ValueChanged<String>? onChanged}) =>
      Input.raw(
        controller: controller,
        autofocus: autofocus,
        inputType: InputType.email(),
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        onChanged: onChanged,
      );

  factory Input.password(
      {required TextEditingController controller,
        bool autofocus = false,
        String hintText = '',
        Widget? prefixIcon}) =>
      Input.raw(
          controller: controller,
          autofocus: autofocus,
          obscure: true,
          inputType: InputType.password(),
          hintText: hintText,
          prefixIcon: prefixIcon);

  @override
  State<StatefulWidget> createState() {
    return _InputState();
  }
}

class _InputState extends State<Input> {
  bool isEmpty = true;
  bool _isHidden = false;

  @override
  void initState() {
    super.initState();
    if (widget.obscure) {
      _isHidden = true;
    }
    isEmpty = widget.controller.text.isEmpty;
  }

  Widget buildSuffixIcon() {
    if (widget.obscure) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: InkWell(
          onTap: () {
            setState(() {
              _isHidden = !_isHidden;
            });
          },
          child: _isHidden
              ? SvgPicture.asset(
            AppIcons.eye,
            colorFilter: ColorFilter.mode(
                context.color.neutral.shade500, BlendMode.srcIn),
            height: 14,
          )
              : SvgPicture.asset(
            AppIcons.eyeSlash,
            colorFilter: ColorFilter.mode(
                context.color.neutral.shade500, BlendMode.srcIn),
            height: 14,
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: widget.suffixIcon ??
          InkWell(
            onTap: () {
              setState(() {
                isEmpty = true;
              });
              widget.controller.clear();
              if (widget.onChanged != null) {
                widget.onChanged!(widget.controller.text);
              }
            },
            child: (isEmpty)
                ? const SizedBox()
                : Icon(
              Icons.clear,
              color: context.color.neutral,
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder enabledInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: context.color.neutral.shade200),
      borderRadius: BorderRadius.circular(8),
      gapPadding: 0,
    );
    OutlineInputBorder focusedInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: context.color.primary),
      borderRadius: BorderRadius.circular(8),
      gapPadding: 0,
    );
    OutlineInputBorder errorInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: context.color.error),
      borderRadius: BorderRadius.circular(8),
      gapPadding: 0,
    );

    return TextFormField(
      enabled: widget.isEnable,
      controller: widget.controller,
      autofocus: widget.autofocus,
      obscureText: _isHidden,
      style: context.theme.textThemeNeutral.s14,
      keyboardType: widget.inputType.keyboardType,
      inputFormatters: widget.inputType.inputFormatters,
      maxLines: widget.maxLine,
      maxLength: widget.maxLength,
      onChanged: (value) {
        if ((value.isNotEmpty && isEmpty) || (value.isEmpty && !isEmpty)) {
          setState(() {
            isEmpty = value.isEmpty;
          });
        }
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      onEditingComplete: widget.onEditingComplete,
      decoration: widget.decoration ??
          InputDecoration(
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              fillColor: widget.fillColor,
              border: InputBorder.none,
              isDense: true,
              suffixIcon: buildSuffixIcon(),
              prefixIcon: widget.prefixIcon,
              filled: true,
              enabledBorder: enabledInputBorder,
              disabledBorder: enabledInputBorder,
              focusedBorder: focusedInputBorder,
              errorBorder: errorInputBorder,
              focusedErrorBorder: errorInputBorder,
              hintText: widget.hintText,
              hintStyle: context.theme.textThemeNeutralFaded.s16,
              errorStyle: context.theme.textThemeError.s12),
      validator: widget.inputType.validator,
    );
  }
}
