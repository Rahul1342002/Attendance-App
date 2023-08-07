import 'package:attendance/services/student_stats_on_date_basis/student_stats_network_provider.dart';
import 'package:attendance/tableCalendar/table_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../services/date_provider.dart';

class CalendarScreen extends ConsumerStatefulWidget {
  final String sectionName;
  final Widget navWidget;
  const CalendarScreen(
      {super.key, required this.navWidget, required this.sectionName});

  @override
  ConsumerState<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends ConsumerState<CalendarScreen> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();

  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final studentsStatsNotifier =
        ref.watch(studentStatsNetworkProvider.notifier);
    return TableCalendar(
      navWidget: widget.navWidget,
      focusedDay: today,
      calendarFormat: _calendarFormat,
      currentDay: _selectedDay,
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      onDaySelected: (_, current) {
        setState(() {
          _selectedDay = current;
          final formatter = DateFormat('dd-MM-yyyy');
          final String formattedDate = formatter.format(current);
          studentsStatsNotifier.getStats(
              formattedDate, "CSE", widget.sectionName);
          ref.read(dateProvider.notifier).updateDate(current);
        });
        // GoRouter.of(context).push("/classlist");
      },
      headerStyle: const HeaderStyle(
        headerMargin: EdgeInsets.only(left: 26, right: 26, top: 26),
        headerPadding: EdgeInsets.all(6),
        formatButtonVisible: false,
        titleCentered: true,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 4,
              spreadRadius: 0,
              offset: Offset(1, 1),
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
      ),
    );
  }
}
