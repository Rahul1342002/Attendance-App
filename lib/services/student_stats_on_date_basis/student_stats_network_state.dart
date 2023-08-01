import 'package:attendance/services/student_stats_on_date_basis/student_stats_network.dart';
import 'package:flutter/material.dart';

class StudentStats {
  final bool? success;
  final Data? data;

  StudentStats({
    this.success,
    this.data,
  });

  StudentStats.fromJson(Map<String, dynamic> json)
      : success = json['success'] as bool?,
        data = (json['data'] as Map<String, dynamic>?) != null
            ? Data.fromJson(json['data'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {'success': success, 'data': data?.toJson()};
}

class Data {
  final int? totalStudents;
  final int? totalPresent;
  final int? totalAbsent;

  Data({
    this.totalStudents,
    this.totalPresent,
    this.totalAbsent,
  });

  Data.fromJson(Map<String, dynamic> json)
      : totalStudents = json['totalStudents'] as int?,
        totalPresent = json['totalPresent'] as int?,
        totalAbsent = json['totalAbsent'] as int?;

  Map<String, dynamic> toJson() => {
        'totalStudents': totalStudents,
        'totalPresent': totalPresent,
        'totalAbsent': totalAbsent
      };
}

class StudentStatsNetworkNotifier extends ChangeNotifier {
  bool isLoading;
  bool errorOccurred;
  String errorMessage;
  StudentStats studentStats;

  StudentStatsNetworkNotifier(
      {required this.isLoading,
      required this.errorMessage,
      required this.errorOccurred,
      required this.studentStats});

  void _updateStateByFetch(String date, String branch, String section) async {
    isLoading = true;
    notifyListeners();

    try {
      final studentStatsData = await fetchStudentStats(date, branch, section);
      isLoading = false;
      studentStats = studentStatsData;
      notifyListeners();
    } catch (err) {
      isLoading = false;
      errorOccurred = true;
      errorMessage = err.toString();
      notifyListeners();
    }
  }

  void getStats(String date, String branch, String section) {
    _updateStateByFetch(date, branch, section);
  }
}
