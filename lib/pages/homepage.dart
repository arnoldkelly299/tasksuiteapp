import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasksuite/pages/notepage.dart';
import 'package:tasksuite/pages/todopage.dart';
import 'package:tasksuite/pages/calpage.dart';
import 'package:tasksuite/pages/stopwatchpage.dart';
import 'package:tasksuite/tools/curvedbuttomnav.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tasksuite/tools/screenhelper.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> boxData = [
    {'icon': LineAwesomeIcons.check_circle_solid, 'label': 'To-Do'},
    {'icon': LineAwesomeIcons.calculator_solid, 'label': 'Calculator'},
    {'icon': LineAwesomeIcons.sticky_note_solid, 'label': 'Notes'},
    {'icon': LineAwesomeIcons.stopwatch_solid, 'label': 'Timer'},
  ];

  @override
  Widget build(BuildContext context) {
    ScreenHelper.init(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 15, 15),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(160.0),
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
            padding: EdgeInsets.only(
              bottom: ScreenHelper.h(
                  0.01), // 1% of screen height for bottom padding
              right: ScreenHelper.w(0.3),
            ),
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start, // Center the row

              children: [
                Padding(padding: EdgeInsets.only(left: 40)),
                Text(
                  'Hello, ',
                  style: GoogleFonts.ubuntu(
                    textStyle:
                        Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontSize: 36,
                              fontWeight: FontWeight.w500,
                              color: Colors.white60,
                            ),
                  ),
                ),
                Text(
                  'Friend',
                  style: GoogleFonts.ubuntu(
                    textStyle: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(
                            fontSize: 36,
                            fontWeight: FontWeight.w500,
                            color: Colors.deepOrange
                            // Change "Friend" color to deep orange
                            ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        height: ScreenHelper.h(0.79),
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(35), // Add padding inside the black box
          child: GridView.count(
            crossAxisCount: 2, // 2 boxes per row
            crossAxisSpacing:
                ScreenHelper.w(0.05), // Responsive space between columns
            mainAxisSpacing:
                ScreenHelper.h(0.05), // Responsive space between rows
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
                              initialIndex: 1)), // Navigate to Timer page
                    );
                  } else if (index == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NavBarPage(
                              initialIndex: 2)), // Navigate to Note page
                    );
                  } else if (index == 3) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NavBarPage(
                              initialIndex: 3)), // Navigate to To-Do List page
                    );
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: index == 3
                        ? Colors.deepOrange
                        : const Color.fromARGB(255, 15, 15, 15),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 255, 255, 255)
                            .withOpacity(0.09),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(3, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        boxData[index]['icon'], // Use the icon from boxData
                        size: 60.0,
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
                          color: index == 3
                              ? const Color.fromARGB(255, 15, 15, 15)
                              : Colors.white60,
                        ),
                      ),
                    ],
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
