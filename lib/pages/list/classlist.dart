import 'package:flutter/material.dart';
import 'components/header.dart';
import 'components/classtab.dart';

class ClassList extends StatelessWidget {
  const ClassList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: 
        ListView(children: [
          
          Nav(),ClassTab(numberOfContainers: 99),

        ]),
      ),
    );
  }
}
