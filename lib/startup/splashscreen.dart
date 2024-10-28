import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:flutter_application_1st/screens/auth/loginpage.dart';
// import 'package:flutter_application_1st/screens/pages/homepage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_eva_icons/flutter_eva_icons.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// import '../../constant/colour.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasksuite/pages/homepage.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  Timer? timer;

  @override
  void initState() {
    setTime();
    super.initState();
  }

  setTime() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) =>  HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/L Shaped Computer Desk Corner Writing Workstation Table with Cabinet Drawer Storage for Home Office Study, Black - Walmart_com.jpeg'), // Your image path
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(
            color: Colors.black.withOpacity(0.9),
          ),
          // Centered text
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: Text(
                'TaskSuite', // Your text
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 60,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  color: Colors.white60,
                ),
              ),
            ),
          ),

          // const SizedBox(
          //   height: 10000,
          // ),

          const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 200),
              child: Icon(Icons.task_alt_rounded,
                  size: 90, color: Colors.deepOrange),
            ),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Text(
                '...a quick access to your tools.',
                style: GoogleFonts.montserrat(
                  fontSize: 23,
                  fontWeight: FontWeight.w200,
                  fontStyle: FontStyle.italic,
                  color: Colors.white60,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
