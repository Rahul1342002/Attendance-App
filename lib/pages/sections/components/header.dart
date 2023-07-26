import 'package:flutter/material.dart';

class Nav1 extends StatelessWidget {
  const Nav1({super.key});

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
              "Select Section",
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
