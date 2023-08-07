import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

String getDay() {
  final todayDate = DateTime.now();
  final formatter = DateFormat('dd-MM-yyyy');
  return formatter.format(todayDate);
}

class DateNotifier extends StateNotifier<String> {
  DateNotifier() : super(getDay());

  void updateDate(DateTime data) {
    state = DateFormat('dd-MM-yyyy').format(data);
  }
}

final dateProvider =
    StateNotifierProvider<DateNotifier, String>((ref) => DateNotifier());
