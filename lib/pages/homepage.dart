import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasksuite/pages/notepage.dart';
import 'package:tasksuite/pages/todopage.dart';
import 'package:tasksuite/pages/calpage.dart';
import 'package:tasksuite/pages/stopwatchpage.dart';
import 'package:tasksuite/tools/curvedbuttomnav.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'package:flutter_eva_icons/flutter_eva_icons.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class HomePage extends StatelessWidget {
  // const HomePage({super.key});
  final List<Map<String, dynamic>> boxData = [
    {'icon': LineAwesomeIcons.check_circle_solid, 'label': 'To-Do'},
    {'icon': LineAwesomeIcons.calculator_solid, 'label': 'Calculator'},
    {'icon': LineAwesomeIcons.sticky_note_solid, 'label': 'Notes'},
    {'icon': LineAwesomeIcons.stopwatch_solid, 'label': 'Timer'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      backgroundColor: const Color.fromARGB(255, 15, 15, 15),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(160.0),
        // Increase the height of the AppBar
        child: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.menu_rounded),
              iconSize: 40,
              padding: const EdgeInsets.only(top: 25, right: 40),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              color: Colors.white60,
            ),
          ],
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            padding: const EdgeInsets.only(
                bottom: 1,
                right: 120), // Adjust the padding to move the text down
            alignment: Alignment.bottomCenter,
            // Align text to the bottom of the AppBar
            child: Text(
              'Hello,Friend',
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
            children: List.generate(4, (index) {
              return GestureDetector(
                onTap: () {
                  if (index == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NavBarPage(
                              initialIndex: 0)), // Navigate to TODO page
                    );
                  } else if (index == 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NavBarPage(
                              initialIndex: 1), // Navigate to Timer page
                        ));
                  } else if (index == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavBarPage(initialIndex: 2),
                      ), // Navigate to Note page
                    );
                  } else if (index == 3) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavBarPage(initialIndex: 3),
                      ), // Navigate to To-Do List page
                    );
                  }
                },
                child: Container(
                  // height: 300,
                  decoration: BoxDecoration(
                    // color: Colors.blue,//debugging color
                    color: index == 3
                        ? Colors
                            .deepOrange // Change the color of the calculator box
                        : const Color.fromARGB(
                            255, 15, 15, 15), // Default color for other boxes
                    // color: const Color.fromARGB(
                    //     255, 15, 15, 15), // Dark color for the boxes
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 255, 255, 255)
                            .withOpacity(0.09), // Darker shadow color
                        spreadRadius: 1, // How far the shadow spreads
                        blurRadius: 10, // Blur effect of the shadow
                        offset:
                            const Offset(3, 3), // Position of the shadow (x, y)
                      ),
                    ],
                  ),
                  child: Column(
                    // This is where the Column begins
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        boxData[index]['icon'], // Use the icon from boxData
                        size: 60.0,
                        // color: Colors.deepOrange, // Icon color
                        color: index == 3
                            ? const Color.fromARGB(255, 15, 15, 15)
                            : Colors.deepOrange,
                      ),
                      const SizedBox(
                          height: 20), // Space between icon and label
                      Text(
                        boxData[index]['label'], // Use the label from boxData
                        style: TextStyle(
                          fontSize: 16.0,
                          // color: Colors.white, // Label text color
                          color: index == 3
                              ? const Color.fromARGB(255, 15, 15, 15)
                              : Colors.white60,
                        ),
                      ),
                    ],
                  ), // This
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
