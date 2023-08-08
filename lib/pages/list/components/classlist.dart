import 'package:attendance/services/student_stats_on_date_basis/student_stats_network_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../services/student_list/student_stats_network_state.dart';
import '../../../services/update_attendance_network.dart';

bool checkIfStudentPresent(String roll, List<String> presentStudents) {
  for (var i = 0; i < presentStudents.length; i++) {
    if (presentStudents[i] == roll) {
      return true;
    }
  }

  return false;
}

class ClassTab extends ConsumerStatefulWidget {
  final StudentsAttendanceNetworkNotifier studentsListState;
  final String date;
  final String sectionName;

  const ClassTab(
      {Key? key,
      required this.studentsListState,
      required this.sectionName,
      required this.date})
      : super(key: key);

  @override
  _ClassTabState createState() => _ClassTabState();
}

class _ClassTabState extends ConsumerState<ClassTab> {
  List<bool> isBoxTappedList = [];
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.studentsListState.isLoading) {
      return const Center(
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
      );
    }
    if (widget.studentsListState.errorOccurred) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.studentsListState.errorMessage,
              style: const TextStyle(
                color: Colors.redAccent,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      );
    }

    if (isInitialized == false) {
      isBoxTappedList = List.generate(
        widget.studentsListState.studentStats.data!.studentsList!.length,
        (index) => checkIfStudentPresent(
          widget
              .studentsListState.studentStats.data!.studentsList![index].roll!,
          widget.studentsListState.studentStats.data!.presentStudents!,
        ),
      );
      isInitialized = true;
    }

    int numberOfRows =
        (widget.studentsListState.studentStats.data!.studentsList!.length / 5)
            .ceil();

    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(0),
              shrinkWrap: true,
              children: List.generate(
                numberOfRows,
                (rowIndex) {
                  int startIndex = rowIndex * 5;
                  int endIndex = (startIndex + 5) >
                          widget.studentsListState.studentStats.data!
                              .studentsList!.length
                      ? widget.studentsListState.studentStats.data!
                          .studentsList!.length
                      : (startIndex + 5);
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      endIndex - startIndex,
                      (index) {
                        int rollNumberIndex = startIndex + index;
                        if (rollNumberIndex >=
                            widget.studentsListState.studentStats.data!
                                .studentsList!.length) {
                          return const SizedBox
                              .shrink(); // Use an empty SizedBox for remaining cells
                        }
                        return rollNumberComponent(rollNumberIndex);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextButton(
              onPressed: () async {
                var presentStudents = <String>[];
                var absentStudents = <String>[];
                var scaffold = ScaffoldMessenger.of(context);
                var router = GoRouter.of(context);
                for (var i = 0; i < isBoxTappedList.length; i++) {
                  if (isBoxTappedList[i]) {
                    presentStudents.add(widget.studentsListState.studentStats
                        .data!.studentsList![i].roll!);
                  } else {
                    absentStudents.add(widget.studentsListState.studentStats
                        .data!.studentsList![i].roll!);
                  }
                }

                if (await updateAttendance(widget.date, "CSE",
                    widget.sectionName, presentStudents, absentStudents)) {
                  scaffold.showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Successfully updated",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      backgroundColor: Colors.greenAccent,
                    ),
                  );
                  ref.read(studentStatsNetworkProvider.notifier).getStats(
                        widget.date,
                        "CSE",
                        widget.sectionName,
                      );
                  router.push("/home?section=${widget.sectionName}");
                } else {
                  scaffold.showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Something went wrong",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: Colors.indigo,
              ),
              child: const Text(
                "Submit",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  GestureDetector rollNumberComponent(int rollNumberIndex) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isBoxTappedList[rollNumberIndex] = !isBoxTappedList[rollNumberIndex];
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 65,
          height: 65,
          decoration: ShapeDecoration(
            color: isBoxTappedList[rollNumberIndex]
                ? const Color(0xFF21D2FF)
                : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Center(
            child: Text(
              widget.studentsListState.studentStats.data!
                  .studentsList![rollNumberIndex].roll!
                  .substring(widget.studentsListState.studentStats.data!
                          .studentsList![rollNumberIndex].roll!.length -
                      3),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isBoxTappedList[rollNumberIndex]
                    ? Colors.white
                    : const Color(0xFF568EF8),
                // Change the text color
                fontSize: 30,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
