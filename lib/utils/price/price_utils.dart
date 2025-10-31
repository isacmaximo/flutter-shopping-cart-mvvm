import 'package:intl/intl.dart';

abstract class PriceUtils {
  static String formatPrice(double price) {
    return NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(price);
  }
}
