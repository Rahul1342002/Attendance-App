import 'package:flutter/material.dart';

import '../../globalWidgets/navBar.dart';
import 'components/calendar.dart';
import 'components/statistics.dart';
import 'components/totalStudent.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                CalendarScreen(
                  navWidget: Nav(),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                totalStudent(),
                Padding(padding: EdgeInsets.only(top: 20)),
                Statics(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
