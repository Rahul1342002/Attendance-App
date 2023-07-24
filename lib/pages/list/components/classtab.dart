import 'package:flutter/material.dart';

class ClassTab extends StatefulWidget {
  final int
      numberOfContainers; // The specific given number of containers to display

  ClassTab({Key? key, required this.numberOfContainers}) : super(key: key);

  @override
  _ClassTabState createState() => _ClassTabState();
}

class _ClassTabState extends State<ClassTab> {
  List<bool> isBoxTappedList = [];
  final List<String> rollNumbers = [
    for (int i = 501; i <= 599; i++) i.toString(),
  ];
  @override
  void initState() {
    super.initState();
    // Initialize the list of tapped states for each box to false initially
    isBoxTappedList =
        List.generate(widget.numberOfContainers, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the number of rows needed based on the number of containers and items per row (5 in this case)
    int numberOfRows = (widget.numberOfContainers / 5).ceil();

    return Column(
      children: List.generate(
        numberOfRows,
        (rowIndex) {
          int startIndex = rowIndex * 5;
          int endIndex = (startIndex + 5) > widget.numberOfContainers
              ? widget.numberOfContainers
              : (startIndex + 5);
          return Row(
            children: List.generate(
              endIndex - startIndex,
              (index) {
                int rollNumberIndex = startIndex + index;
                if (rollNumberIndex >= widget.numberOfContainers) {
                  return SizedBox
                      .shrink(); // Use an empty SizedBox for remaining cells
                }
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      isBoxTappedList[rollNumberIndex] =
                          !isBoxTappedList[rollNumberIndex];
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 65,
                      height: 65,
                      decoration: ShapeDecoration(
                        color: isBoxTappedList[rollNumberIndex]
                            ? Color(0xFF21D2FF)
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
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
                      child: Center(
                        child: Text(
                          rollNumbers[rollNumberIndex],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: isBoxTappedList[rollNumberIndex]
                                ? Colors.white
                                : Color(0xFF568EF8), // Change the text color
                            fontSize: 30,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}