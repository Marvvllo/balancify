import 'package:intl/intl.dart';

class Helper {
  static String stringToIdr(String numberString, decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(int.parse(numberString));
  }

  static String stringToCompactIdr(String numberString) {
    NumberFormat currencyFormatter = NumberFormat.compactCurrency(
      locale: 'id',
      symbol: 'Rp',
    );
    return currencyFormatter.format(int.parse(numberString));
  }
}
