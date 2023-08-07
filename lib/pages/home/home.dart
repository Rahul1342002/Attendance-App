import 'package:attendance/services/date_provider.dart';
import 'package:attendance/services/student_list/student_stats_network_provider.dart';
import 'package:attendance/services/student_stats_on_date_basis/student_stats_network_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
    final date = ref.watch(dateProvider);
    print(studentStatsState.isLoading);

    return MaterialApp(
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: GestureDetector(
          onTap: () {
            ref
                .read(studentsListNetworkProvider.notifier)
                .getStats(date, "CSE", sectionName);
            GoRouter.of(context)
                .go("/classlist?section=$sectionName&date=$date");
          },
          child: Transform.rotate(
            angle: 45 * 3.1415 / 180,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.brown.withAlpha(1000),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Transform.rotate(
                angle: 45 * 3.1415 / 180,
                child: const Icon(
                  Icons.add,
                  color: Colors.black45,
                  size: 48,
                ),
              ),
            ),
          ),
        ),
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
