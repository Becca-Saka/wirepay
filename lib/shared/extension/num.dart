import 'package:intl/intl.dart';
import 'package:wirepay/shared/extension/string.dart';

extension DoubleExtension on num? {
  String get currency {
    if (this == null) return "0.00";
    NumberFormat formatter = NumberFormat("#,##0.00", "en_UK");
    return formatter.format(this).removeZero;
  }

  String withCurrency(String locale) {
    if (this == null) return "0.00";
    final formatter = NumberFormat.currency(symbol: '');

    return formatter.format(this);
  }
}
