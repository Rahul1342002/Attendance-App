import 'package:flutter/material.dart';

class totalStudent extends StatefulWidget {
  final int students;
  const totalStudent({super.key, required this.students});

  @override
  State<totalStudent> createState() => _totalStudentState();
}

class _totalStudentState extends State<totalStudent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 375,
        height: 94,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 375,
                height: 94,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              left: 26,
              top: 34,
              child: SizedBox(
                width: 221,
                height: 52,
                child: Text(
                  'Total Students',
                  style: TextStyle(
                    color: Color(0xFF353437),
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 305,
              top: 29,
              child: Container(
                width: 38,
                height: 38,
                decoration: ShapeDecoration(
                  color: Color(0xFF568EF8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 305,
              top: 38,
              child: SizedBox(
                width: 38,
                height: 38,
                child: Text(
                  widget.students.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
