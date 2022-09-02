import 'package:intl/intl.dart';

import 'date_formater.dart';

extension FormatChatDate on DateTime {
  String get toChatDateFormat => ConversationDateFormater.getDateBubbleDate(this);
}

extension DateToString on DateTime {
  static DateFormat formatter = DateFormat('yyyy-MM-dd');
  String get dateToString => formatter.format(this);
}
