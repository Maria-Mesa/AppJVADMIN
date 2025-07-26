import 'package:intl/intl.dart';

extension CurrencyExtension on num {
  /// Formats the number as a currency string.
  String formatCurrency() {
    return NumberFormat.currency(
      locale: 'es_CO',
      customPattern: '\$ #,###',
      decimalDigits: 0,
    ).format(this);
  }
}
