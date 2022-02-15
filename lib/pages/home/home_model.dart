import 'package:intl/intl.dart';

class HomeModel {
  final String currentDay = DateFormat('EEEE', 'tr_TR').format(DateTime.now());
  final String currentDate =
      DateFormat('d MMMM y', 'tr_TR').format(DateTime.now());
}
