import 'package:intl/intl.dart';

class DateTimeFormatters{
  const DateTimeFormatters._();


  static String getLocalDate({required DateTime utcDateTime}) {
    DateTime localDateTime = utcDateTime.toLocal();
    String formattedDate = DateFormat("dd MMMM yyyy").format(localDateTime);
    return formattedDate; // e.g. 21 October 2025
  }

  static String getLocalDateV2({required DateTime utcDateTime}) {
    DateTime localDateTime = utcDateTime.toLocal();
    String formattedDate = DateFormat("dd MMM yyyy").format(localDateTime);
    return formattedDate; // e.g. 21 October 2025
  }


  static String getLocalTime({required DateTime utcDateTime}) {
    DateTime localDateTime = utcDateTime.toLocal();
    String formattedTime = DateFormat("hh:mm a").format(localDateTime);
    return formattedTime; // e.g. 12:20 PM
  }



  static String formatDate({DateTime? dateTime}) {
    try {
      return DateFormat("dd MMM yyyy").format(dateTime ?? DateTime.now());
    } catch (e) {
      return "Invalid Date"; // Handle invalid date format
    }
  }

  static String formatDateV2({DateTime? dateTime}) {
    try {
      return DateFormat("MMM dd, yyyy").format(dateTime ?? DateTime.now());
    } catch (e) {
      return "Invalid Date"; // Handle invalid date format
    }
  }


  static String formatDateToTime({DateTime? dateTime}) {
    return DateFormat.jm().format(dateTime ?? DateTime.now()); // e.g., "10:00 AM"
  }

  static bool isWithin7Days(DateTime deliveredDate, DateTime currentDate) {
    final difference = currentDate.difference(deliveredDate).inDays;
    return difference >= 0 && difference <= 7;
  }


}