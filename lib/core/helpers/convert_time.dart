import 'package:intl/intl.dart';

String convertTime(DateTime time) {
  final DateTime now = DateTime.now();
  final Duration difference = now.difference(time);

  if (difference.inMinutes < 60) {
    return '${difference.inMinutes}m ago';
  } else if (difference.inHours < 24) {
    return '${difference.inHours}h ago';
  } else if (difference.inDays < 30) {
    return '${difference.inDays}d ago';
  } else {
    return DateFormat('dd/MM/yyyy').format(time);
  }
}
