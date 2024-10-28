import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:tasksuite/pages/homepage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_eva_icons/flutter_eva_icons.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'calpage.dart';
import 'notepage.dart';
// import 'stopwatchpage.dart';
import 'todopage.dart';

class Stopwatchpage extends StatefulWidget {
  const Stopwatchpage({super.key});

  @override
  State<Stopwatchpage> createState() => _StopwatchpageState();
}

class _StopwatchpageState extends State<Stopwatchpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Padding(
          padding: EdgeInsets.only(top: 35.0, right: 20),
          child: Text(
            'TIMER',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white60,
                fontSize: 25,
                wordSpacing: 10),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(LineAwesomeIcons.home_solid),
            iconSize: 25,
            padding: const EdgeInsets.only(top: 35, right: 110),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            color: Colors.deepOrange,
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 15, 15, 15),
      body: Container(
        height: 750,
        decoration: BoxDecoration(
          color: Colors.black, // Set background color to black
          borderRadius: const BorderRadius.only(
            bottomLeft:
                Radius.circular(70), // Radius for the bottom-left corner
            bottomRight:
                Radius.circular(70), // Radius for the bottom-right corner
          ), // Add rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.020), // Soft shadow
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
      ),
    );
  }
}
