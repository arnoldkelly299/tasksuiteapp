import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasksuite/pages/homepage.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Stopwatchpage extends StatefulWidget {
  const Stopwatchpage({super.key});

  @override
  State<Stopwatchpage> createState() => _StopwatchpageState();
}

class _StopwatchpageState extends State<Stopwatchpage> {
  late Timer _timer; // Timer object to control the stopwatch
  int _seconds = 0;
  bool _isRunning = false;

  // Format the time in `hh:mm:ss` format
  String get _formattedTime {
    int hours = _seconds ~/ 3600;
    int minutes = (_seconds % 3600) ~/ 60;
    int seconds = _seconds % 60;

    return '${_padNumber(hours)}:${_padNumber(minutes)}:${_padNumber(seconds)}';
  }

  // Function to pad single digits with zero
  String _padNumber(int number) {
    return number.toString().padLeft(2, '0');
  }

  // Start or resume the timer
  void _startTimer() {
    _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  // Stop the timer
  void _stopTimer() {
    _isRunning = false;
    _timer.cancel();
  }

  // Reset the timer
  void _resetTimer() {
    setState(() {
      _isRunning = false;
      _seconds = 0; // Reset seconds to 0
    });
    if (_isRunning) {
      _timer.cancel(); // Ensure the timer is stopped before reset
    }
    // Timer is now effectively reset
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black, // Set background color to black
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(70),
            bottomRight: Radius.circular(70),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.020),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Timer Display
            Text(
              _formattedTime,
              style: GoogleFonts.ubuntu(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            // Control Buttons: Start/Stop/Reset
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _isRunning
                      ? null
                      : _startTimer, // Disable if already running
                  child: const Text("Start"),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.orange),
                  ),
                  
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed:
                      !_isRunning ? null : _stopTimer, // Disable if not running
                  child: const Text("Stop"),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.deepOrange),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _resetTimer,
                  child: const Text("Reset"),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.amber),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
