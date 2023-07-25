import 'package:flutter/material.dart';

import '../../globalWidgets/navBar.dart';
import 'components/classtab.dart';

class ClassList extends StatelessWidget {
  const ClassList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            const Nav(),
            ClassTab(numberOfContainers: 118),
          ],
        ),
      ),
    );
  }
}
