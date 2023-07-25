import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 428,
          height: 128,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 428,
                  height: 100,
                  decoration: ShapeDecoration(
                    color: Color(0xFF568EF8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 27,
                top: 68,
                child: Container(
                  width: 375,
                  height: 60,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
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
              const Positioned(
                left: 61,
                top: 17,
                child: SizedBox(
                  width: 307,
                  height: 41,
                  child: Text(
                    'Attendance',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 27,
                top: 84,
                child: SizedBox(
                  width: 375,
                  height: 60,
                  child: Text(
                    'January, 2023',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 368,
                top: 86,
                child: Container(
                  width: 24,
                  height: 24,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Icon(Iconsax.arrow_right_3,
                  color: Colors.blue.shade400,),
                ),
              ),
              Positioned(
                left: 37,
                top: 86,
                child: Container(
                  width: 24,
                  height: 24,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Icon(Iconsax.arrow_left_2,
                  color: Colors.blue.shade400,
                  ),
                ),
              ),
              Positioned(
                left: 15,
                top: 17 ,
                child: Container(
                  width: 30,
                  height: 30,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Icon(Iconsax.textalign_left),),
                ),
            ],
          ),
        ),
      ],
    );
  }
}