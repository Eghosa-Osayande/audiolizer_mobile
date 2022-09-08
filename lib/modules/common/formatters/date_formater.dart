import 'package:intl/intl.dart';

class CustomDateFormater {
  static final DateFormat _formatter = DateFormat('yyyy/MM/dd');

  static String getProjectUpdatedTime(DateTime date) {
    return '${_getChatBubbleDate(date)} - ${_getDateBubbleDate(date)}';
  }

  /// use for chat bubble
  static String _getChatBubbleDate(DateTime date) {
    date = date.toLocal();
    return DateFormat('jm').format(date);
  }

  /// use for conversation tile
  static String _getConversationDate(DateTime date) {
    date = date.toLocal();
    final now = DateTime.now().toLocal();

    String getWeekDay() {
      switch (date.weekday) {
        case 1:
          return 'Monday';
        case 2:
          return 'Tuesday';
        case 3:
          return 'Wednesday';
        case 4:
          return 'Thursday';
        case 5:
          return 'Friday';
        case 6:
          return 'Saturday';
        case 7:
          return 'Sunday';
        default:
          return '';
      }
    }

    final diff = now.day - date.day;
    switch (diff) {
      case 0:
        return _getChatBubbleDate(date);
      case 1:
        return 'Yesterday';
      case 2:
        return '${getWeekDay()}';
      case 3:
        return '${getWeekDay()}';
      case 4:
        return '${getWeekDay()}';
      case 5:
        return '${getWeekDay()}';
      case 6:
        return '${getWeekDay()}';
      case 7:
        return '${getWeekDay()}';
      default:
        return _formatter.format(date);
    }
  }

  /// use for date bubble
  static String _getDateBubbleDate(DateTime date) {
    date = date.toLocal();
    // return getConversationDate(date);
    final now = DateTime.now();
    final nowUtc = DateTime.utc(now.year, now.month, now.day);
    final dateUtc = DateTime.utc(date.year, date.month, date.day);
    // To calculate the no. of days between two dates

    final differenceInDays = nowUtc.difference(dateUtc).inDays;
    // To calculate the no. of days between two dates
    switch (differenceInDays) {
      case 0:
        return 'Today';
      case 1:
        return 'Yesterday';
      default:
        return _formatter.format(date);
    }
  }
}
