import 'package:attendance/services/student_stats_on_date_basis/student_stats_network_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../globalWidgets/navBar.dart';
import 'components/calendar.dart';
import 'components/statistics.dart';
import 'components/totalStudent.dart';

class Home extends ConsumerWidget {
  final String sectionName;

  const Home({Key? key, required this.sectionName}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentStatsState = ref.watch(studentStatsNetworkProvider);
    print(studentStatsState.isLoading);

    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              CalendarScreen(
                navWidget: const Nav(),
                sectionName: sectionName,
              ),
              if (studentStatsState.isLoading)
                const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: Colors.blueAccent,
                      ),
                      Text(
                        "Fetching information...",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              if (studentStatsState.errorOccurred)
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        studentStatsState.errorMessage,
                        style: const TextStyle(
                          color: Colors.redAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              if (!studentStatsState.isLoading &&
                  !studentStatsState.errorOccurred)
                const Padding(padding: EdgeInsets.only(top: 20)),
              if (!studentStatsState.isLoading &&
                  !studentStatsState.errorOccurred)
                totalStudent(
                  students: studentStatsState.studentStats.data!.totalStudents!,
                ),
              if (!studentStatsState.isLoading &&
                  !studentStatsState.errorOccurred)
                const Padding(padding: EdgeInsets.only(top: 20)),
              if (!studentStatsState.isLoading &&
                  !studentStatsState.errorOccurred)
                Statics(
                  totalAbsent:
                      studentStatsState.studentStats.data!.totalAbsent!,
                  totalPresent:
                      studentStatsState.studentStats.data!.totalPresent!,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
