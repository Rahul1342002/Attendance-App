import 'package:attendance/services/student_stats_on_date_basis/student_stats_network_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final studentStatsNetworkProvider =
    ChangeNotifierProvider<StudentStatsNetworkNotifier>((ref) {
  return StudentStatsNetworkNotifier(
      isLoading: true,
      errorMessage: "",
      errorOccurred: false,
      studentStats: StudentStats());
});
