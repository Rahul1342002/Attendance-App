import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();

  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 27,
        top: 50,
        child: TableCalendar(
          focusedDay: today,
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    const BoxShadow(
                        color: Colors.black,
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: Offset(4, 4)),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(50)))),
        ));
  }
}
