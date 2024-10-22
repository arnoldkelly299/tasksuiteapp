import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasksuite/pages/notepage.dart';
import 'package:tasksuite/pages/todopage.dart';
import 'package:tasksuite/pages/calpage.dart';
import 'package:tasksuite/pages/stopwatchpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      backgroundColor: const Color.fromARGB(255, 15, 15, 15),

      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(160.0), // Increase the height of the AppBar
        child: AppBar(
          backgroundColor: Colors.black,
          flexibleSpace: Container(
            padding: const EdgeInsets.only(
                bottom: 1,
                right: 120), // Adjust the padding to move the text down
            alignment: Alignment
                .bottomCenter, // Align text to the bottom of the AppBar
            child: Text(
              'Hello, Friend',
              style: GoogleFonts.ubuntu(
                textStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                      color: Colors.white60,
                    ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        height: 630,
        decoration: BoxDecoration(
          color: Colors.black, // Set background color to black
          borderRadius: const BorderRadius.only(
            bottomLeft:
                Radius.circular(50), // Radius for the bottom-left corner
            bottomRight:
                Radius.circular(50), // Radius for the bottom-right corner
          ), // Add rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.020), // Soft shadow
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        // Set the background color of the entire box to black
        child: Padding(
          padding: const EdgeInsets.all(35), // Add padding inside the black box
          child: GridView.count(
            crossAxisCount: 2, // 2 boxes per row
            crossAxisSpacing: 23.0, // Space between columns
            mainAxisSpacing: 23.0, // Space between rows
            children: List.generate(6, (index) {
              return GestureDetector(
                onTap: () {
                  if (index == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ToDopage()), // Navigate to Calculator page
                    );
                  } else if (index == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Calpage()), // Navigate to Timer page
                    );
                  } else if (index == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const Notepage()), // Navigate to Note page
                    );
                  } else if (index == 3) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Stopwatchpage()), // Navigate to To-Do List page
                    );
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                        255, 15, 15, 15), // Dark color for the boxes
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 255, 255, 255)
                            .withOpacity(0.09), // Darker shadow color
                        spreadRadius: 1, // How far the shadow spreads
                        blurRadius: 10, // Blur effect of the shadow
                        offset: Offset(3, 3), // Position of the shadow (x, y)
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Box ${index + 1}',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 140, 140, 140), // Text color
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
