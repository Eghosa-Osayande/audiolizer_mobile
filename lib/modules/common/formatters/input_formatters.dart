import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:intl/intl.dart';

import 'string_formatter.dart';

class AppTextInputFormatters {
  static TextInputFormatter getNairaInputFormatter() {
    return TextInputFormatter.withFunction((oldValue, newValue) {
      var letters = newValue.text.split('');
      var newText = '';

      if (newValue.text.isEmpty) {
        newText = StringFormatter.naira;
      } else {
        newText = NumberFormat.currency(
                symbol: StringFormatter.naira + StringFormatter.nairaSpace,
                decimalDigits: 0)
            .format(
          double.parse(
            newValue.text
                .replaceAll(StringFormatter.seperator, '')
                .replaceAll(StringFormatter.naira, ''),
          ),
        );
      }

      return newValue.copyWith(
          selection: TextSelection.collapsed(offset: newText.length),
          text: newText);
    });
  }

  static TextInputFormatter getCommaSeperatedStringFormatter({
    String prefix = StringFormatter.nairaSpace,
  }) {
    return TextInputFormatter.withFunction((oldValue, newValue) {
      var letters = newValue.text.split('');
      var newText =
          NumberFormat.currency(symbol: prefix, decimalDigits: 0).format(
        double.parse(newValue.text.replaceAll(StringFormatter.seperator, '')),
      );

      return newValue.copyWith(
          selection: TextSelection.collapsed(offset: newText.length),
          text: newText);
    });
  }
}
