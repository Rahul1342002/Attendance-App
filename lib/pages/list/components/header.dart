import 'package:flutter/material.dart';

class Nav2 extends StatelessWidget {
  const Nav2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 94,
      decoration: const ShapeDecoration(
        color: Color(0xFF568EF8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32),
            child: Text(
              "Class List",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
