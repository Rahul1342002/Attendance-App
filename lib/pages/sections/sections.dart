import 'package:attendance/pages/sections/components/header.dart';
import 'package:flutter/material.dart';

import 'components/sect.dart';

class Section extends StatelessWidget {
  const Section({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: const [
            Nav1(name: "Select Section",),
            Sect(),
          ],
        ),
      ),
    );
  }
}
