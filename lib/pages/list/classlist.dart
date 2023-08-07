import 'package:attendance/pages/list/components/header.dart';
import 'package:attendance/services/student_list/student_stats_network_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/classlist.dart';

class ClassList extends ConsumerWidget {
  final String date;
  final String sectionName;

  const ClassList({Key? key, required this.sectionName, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentsList = ref.watch(studentsListNetworkProvider);
    return Scaffold(
      body: Column(
        children: [
          const Nav2(),
          Expanded(
            child: ColoredBox(
              color: Colors.white,
              child: ClassTab(
                date: date,
                sectionName: sectionName,
                studentsListState: studentsList,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
