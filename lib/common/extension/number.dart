import 'package:intl/intl.dart';

NumberFormat currencyFormatter = NumberFormat.decimalPatternDigits(
  locale: 'en_us',
  decimalDigits: 0,
);

extension IntExt on int? {
  String get currency {
    if (this == null) {
      return '--- Won';
    } else {
      return '${currencyFormatter.format(this)} Won';
    }
  }
}
