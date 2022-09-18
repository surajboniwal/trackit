import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final formattedCurrencyProvider = Provider.family.autoDispose<String, int>(
  (ref, amount) => NumberFormat.currency(
    locale: 'en-IN',
    symbol: "₹",
  ).format(amount),
);
