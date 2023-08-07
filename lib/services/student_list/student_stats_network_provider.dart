import 'package:attendance/services/student_list/student_stats_network_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final studentsListNetworkProvider =
    ChangeNotifierProvider<StudentsAttendanceNetworkNotifier>((ref) {
  return StudentsAttendanceNetworkNotifier(
      isLoading: true,
      errorMessage: "",
      errorOccurred: false,
      studentStats: StudentsList());
});
