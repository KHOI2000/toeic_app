import 'package:flutter/material.dart';
import 'package:toeic_app/common/extension/extension.dart';

class Button extends StatelessWidget {
  final VoidCallback? onPressed;
  final double paddingVertical;
  final double paddingHorizontal;
  final double? borderRadius;
  final String buttonName;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const Button.raw({
    super.key,
    required this.buttonName,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
    this.borderRadius,
    required this.paddingVertical,
    required this.paddingHorizontal,
  });

  factory Button.primary(
      {required String buttonName,
        double? padding,
        double? paddingHorizontal,
        double? borderRadius,
        Widget? prefixIcon,
        Widget? suffixIcon,
        VoidCallback? onPressed}) =>
      Button.raw(
        paddingVertical: padding ?? 12,
        paddingHorizontal: paddingHorizontal ?? 24,
        borderRadius: borderRadius,
        onPressed: onPressed,
        buttonName: buttonName,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: WidgetStateProperty.resolveWith<double>(
          // As you said you dont need elevation. I'm returning 0 in both case
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return 0;
            }
            return 0; // Defer to the widget's default.
          },
        ),
        padding: WidgetStateProperty.all(EdgeInsets.symmetric(
            vertical: paddingVertical, horizontal: paddingHorizontal)),
        shape: WidgetStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12))),
        side: WidgetStateProperty.resolveWith<BorderSide?>((states) {
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(
                color: context.color.neutral.shade400,
                width: 1.0); // Display border in disabled state
          }
          return null; // No border in active state
        }),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return context.color.neutral.shade50;
          }
          return context.color.secondary;
        }),
        textStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return context.theme.textThemeNeutralFaded.s16.semiBold;
          }
          return context.theme.textThemePrimary.s16.semiBold;
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return context.color.neutral.shade400; // Disabled state color
          }
          return context.color.primary; // Active state color
        }),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (prefixIcon != null)
              ? Padding(
            padding: const EdgeInsets.only(right: 12),
            child: prefixIcon,
          )
              : const SizedBox(),
          Text(buttonName),
          (suffixIcon != null)
              ? Padding(
            padding: const EdgeInsets.only(left: 12),
            child: suffixIcon,
          )
              : const SizedBox(),
        ],
      ),
    );
  }
}
