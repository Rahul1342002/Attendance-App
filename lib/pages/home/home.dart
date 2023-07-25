import 'package:attendance/pages/home/components/header.dart';
import 'package:attendance/pages/home/components/statistics.dart';
import 'package:attendance/pages/home/components/totalStudent.dart';

import 'package:flutter/material.dart';
import 'components/header.dart';
import 'components/calendar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
 
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      
      home: Scaffold(
        body: ListView(children: [
          Nav(),CalendarScreen(),
          Padding(padding: EdgeInsets.only(top: 20)),
          totalStudent(),
          Padding(padding: EdgeInsets.only(top: 20)), Statics()
          
        ]),
      ),
    );
  }
}

