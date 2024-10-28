import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:tasksuite/pages/homepage.dart';
import 'package:tasksuite/pages/todopage.dart';
import 'package:tasksuite/pages/calpage.dart';
import 'package:tasksuite/pages/notepage.dart';
import 'package:tasksuite/pages/stopwatchpage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class NavBarPage extends StatefulWidget {
  final int initialIndex;

  NavBarPage({required this.initialIndex});

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Todopage(), // Add your CalculatorPage here
    const Calpage(), // Add your TimerPage here
    const Notepage(), // Add your NotesPage here
    const Stopwatchpage(), // Add your ToDoPage here
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex =
        widget.initialIndex; // Set initial page based on the tapped box
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Display the correct page
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor:
            const Color.fromARGB(255, 15, 15, 15), // Customize background
        color: Colors.black, // Bar color
        buttonBackgroundColor: Colors.black, // Button color
        height: 75,
        index: _currentIndex,
        items: const <Widget>[
          Icon(LineAwesomeIcons.check_circle_solid,
              size: 35, color: Colors.deepOrange),
          Icon(LineAwesomeIcons.calculator_solid,
              size: 35, color: Colors.deepOrange),
          Icon(LineAwesomeIcons.sticky_note,
              size: 35, color: Colors.deepOrange),
          Icon(LineAwesomeIcons.stopwatch_solid,
              size: 35, color: Colors.deepOrange),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the current page on tap
          });
        },
      ),
    );
  }
}
