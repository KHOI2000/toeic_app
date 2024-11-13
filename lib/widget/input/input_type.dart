import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputType {
  final int maxLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;

  InputType(
      {this.maxLines = 1,
        this.maxLength,
        this.keyboardType,
        this.textCapitalization,
        this.inputFormatters,
        this.validator});

  factory InputType.phone() {
    return InputType(
        maxLines: 1,
        maxLength: 10,
        textCapitalization: TextCapitalization.none,
        inputFormatters: [
          LengthLimitingTextInputFormatter(10),
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value == null || value.length < 10 || !value.startsWith('0')) {
            return 'Số điện thoại có 10 số và bắt đầu bằng 0';
          }
          return null;
        });
  }

  factory InputType.number() {
    return InputType(
        maxLines: 1,
        textCapitalization: TextCapitalization.none,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Trường này không được bỏ trống';
          }
          return null;
        });
  }

  factory InputType.double() {
    return InputType(
        maxLines: 1,
        textCapitalization: TextCapitalization.none,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'))
        ],
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Trường này không được bỏ trống';
          }
          return null;
        });
  }
  factory InputType.password() {
    return InputType(
        maxLines: 1,
        maxLength: 6,
        textCapitalization: TextCapitalization.none,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(6),
          FilteringTextInputFormatter.digitsOnly
        ],
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Trường này không được bỏ trống';
          }
          return null;
        });
  }

  factory InputType.rePassword(TextEditingController data) {
    return InputType(
        maxLines: 1,
        maxLength: 6,
        textCapitalization: TextCapitalization.none,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(6),
          FilteringTextInputFormatter.digitsOnly
        ],
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Trường này không được bỏ trống';
          } else if (value != data.text) {
            return 'Mã pin không hợp lệ';
          }
          return null;
        });
  }

  factory InputType.text() {
    return InputType(
        maxLines: 1,
        textCapitalization: TextCapitalization.none,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Trường này không được bỏ trống';
          }
          return null;
        });
  }

  factory InputType.email() {
    return InputType(
        maxLines: 1,
        textCapitalization: TextCapitalization.none,
        keyboardType: TextInputType.emailAddress,
        maxLength: 256,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Trường này không được bỏ trống';
          }
          const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
              r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
              r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
              r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
              r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
              r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
              r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
          final regex = RegExp(pattern);

          return !regex.hasMatch(value) ? 'Email không đúng định dạng' : null;
        });
  }
}
