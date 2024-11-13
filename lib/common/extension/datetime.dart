import 'package:intl/intl.dart';

final dateFormatter = DateFormat('yyyy.MM.dd');
final timeFormatter = DateFormat('HH:mm');
final dateTimeFormatter = DateFormat('yyyy-MM-dd HH:mm:ss');
final yyyyMMFormatter = DateFormat('yyyy.MM');
final mMMddHHmmFormatter = DateFormat('MMM dd, HH:mm');
final mMMddyyyyFormatter = DateFormat('MMM dd, yyyy');
final hHmm = DateFormat('HH:mm');

extension DateTimeExt on DateTime? {
  String get dateString {
    if (this == null) {
      return '';
    } else {
      return dateFormatter.format(this!);
    }
  }
}
