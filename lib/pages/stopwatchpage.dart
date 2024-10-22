import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Stopwatchpage extends StatefulWidget {
  const Stopwatchpage({super.key});

  @override
  State<Stopwatchpage> createState() => _StopwatchpageState();
}

class _StopwatchpageState extends State<Stopwatchpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('stopwatch'),
    );
  }
}
