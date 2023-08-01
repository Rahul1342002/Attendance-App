import 'package:flutter/material.dart';

class Statics extends StatefulWidget {
  final int totalPresent;
  final int totalAbsent;
  const Statics(
      {super.key, required this.totalAbsent, required this.totalPresent});

  @override
  State<Statics> createState() => _StaticsState();
}

class _StaticsState extends State<Statics> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 375,
        height: 211,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 172,
                height: 211,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 172,
                        height: 211,
                        decoration: ShapeDecoration(
                          color: Color(0xFFFF4881),
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
                      left: 67,
                      top: 94,
                      child: SizedBox(
                        width: 104,
                        height: 108,
                        child: Text(
                          widget.totalAbsent.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 76,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 26,
                      top: 19,
                      child: SizedBox(
                        width: 120,
                        height: 26,
                        child: Text(
                          'Total Absent',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 203,
              top: 0,
              child: Container(
                width: 172,
                height: 211,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 172,
                        height: 211,
                        decoration: ShapeDecoration(
                          color: Color(0xFF21D2FF),
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
                      left: 29,
                      top: 19,
                      child: SizedBox(
                        width: 120,
                        height: 26,
                        child: Text(
                          'Total Present',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 67,
                      top: 94,
                      child: SizedBox(
                        width: 104,
                        height: 108,
                        child: Text(
                          widget.totalPresent.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 76,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
