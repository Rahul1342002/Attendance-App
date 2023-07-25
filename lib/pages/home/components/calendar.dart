import 'package:attendance/tableCalendar/table_calendar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CalendarScreen extends StatefulWidget {
  final Widget navWidget;
  const CalendarScreen({super.key, required this.navWidget});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();

  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
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
        });
        GoRouter.of(context).push("/sections");
      },
      headerStyle: const HeaderStyle(
        headerMargin: EdgeInsets.only(left: 26, right: 26),
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
