import 'dart:convert';

import 'package:attendance/services/student_stats_on_date_basis/student_stats_network_state.dart';
import 'package:http/http.dart' as http;

Future<StudentStats> fetchStudentStats(
    String date, String branch, String section) async {
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request(
      'POST', Uri.parse('http://192.168.0.102:16000/getStudentsStats'));
  request.body =
      json.encode({"date": date, "branch": branch, "section": section});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  final responseData = await response.stream.bytesToString();
  print(responseData);
  final jsonDecodedData = json.decode(responseData);

  if (response.statusCode == 200) {
    return StudentStats.fromJson(jsonDecodedData);
  } else {
    throw FormatException(jsonDecodedData["msg"]!);
  }
}
