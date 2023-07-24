

import 'components/sect.dart';
import 'package:flutter/material.dart';
import 'components/header.dart';


class Section extends StatelessWidget {
  const Section({Key? key}) : super(key: key);
 
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      
      home: Scaffold(
        body: ListView(children: [
          Nav(),Sect(),
        ]),
      ),
    );
  }
}

