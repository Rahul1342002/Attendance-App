import 'package:attendance/pages/list/components/header.dart';
import 'package:flutter/material.dart';

import '../../globalWidgets/navBar.dart';
import 'components/classlist.dart';

class ClassList extends StatelessWidget {
  const ClassList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            const Nav2(),
            
            ClassTab(),
          ],
        ),
      ),
    );
  }
}
