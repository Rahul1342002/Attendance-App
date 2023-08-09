import 'dart:convert';

import 'package:http/http.dart' as http;

Future<bool> updateAttendance(String date, String branch, String section,
    List<String> presentStudents, List<String> absentStudents) async {
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request(
      'POST',
      Uri.parse(
          'https://attendance-backend-node-9954mwjmf-rahul1342002.vercel.app/api/updateAttendance'));
  request.body = json.encode({
    "date": date,
    "branch": branch,
    "section": section,
    "presentStudents": presentStudents,
    "absentStudents": absentStudents,
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  final responseData = await response.stream.bytesToString();
  print(responseData);

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
