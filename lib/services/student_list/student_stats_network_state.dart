import 'package:attendance/services/student_list/student_stats_network.dart';
import 'package:flutter/material.dart';

class StudentsList {
  final bool? success;
  final Data? data;

  StudentsList({
    this.success,
    this.data,
  });

  StudentsList.fromJson(Map<String, dynamic> json)
      : success = json['success'] as bool?,
        data = (json['data'] as Map<String, dynamic>?) != null
            ? Data.fromJson(json['data'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {'success': success, 'data': data?.toJson()};
}

class Data {
  final List<String>? presentStudents;
  final List<String>? absentStudents;
  final List<StudentInfo>? studentsList;

  Data({
    this.presentStudents,
    this.absentStudents,
    this.studentsList,
  });

  Data.fromJson(Map<String, dynamic> json)
      : presentStudents = (json['presentStudents'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        absentStudents = (json['absentStudents'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        studentsList = (json['studentsList'] as List?)
            ?.map(
                (dynamic e) => StudentInfo.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'presentStudents': presentStudents,
        'absentStudents': absentStudents,
        'studentsList': studentsList?.map((e) => e.toJson()).toList()
      };
}

class StudentInfo {
  final String? id;
  final String? roll;
  final String? name;
  final String? branch;
  final String? section;
  final String? phoneNumber;
  final String? email;

  StudentInfo({
    this.id,
    this.roll,
    this.name,
    this.branch,
    this.section,
    this.phoneNumber,
    this.email,
  });

  StudentInfo.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        roll = json['roll'] as String?,
        name = json['name'] as String?,
        branch = json['branch'] as String?,
        section = json['section'] as String?,
        phoneNumber = json['phoneNumber'] as String?,
        email = json['email'] as String?;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'roll': roll,
        'name': name,
        'branch': branch,
        'section': section,
        'phoneNumber': phoneNumber,
        'email': email
      };
}

class StudentsAttendanceNetworkNotifier extends ChangeNotifier {
  bool isLoading;
  bool errorOccurred;
  String errorMessage;
  StudentsList studentStats;

  StudentsAttendanceNetworkNotifier(
      {required this.isLoading,
      required this.errorMessage,
      required this.errorOccurred,
      required this.studentStats});

  void _updateStateByFetch(String date, String branch, String section) async {
    isLoading = true;
    notifyListeners();

    try {
      final studentStatsData = await fetchStudentList(date, branch, section);
      isLoading = false;
      studentStats = studentStatsData;
      notifyListeners();
    } catch (err) {
      print(err);
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
