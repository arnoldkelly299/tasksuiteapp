import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homepage.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:tasksuite/tools/screenhelper.dart';

class Calpage extends StatefulWidget {
  const Calpage({super.key});

  @override
  State<Calpage> createState() => _CalpageState();
}

class _CalpageState extends State<Calpage> {
  String displayText = ""; // Display for current input or result
  String currentOperand = ""; // Stores the current operand
  double? firstNumber; // Stores the first number for calculations

  void buttonPressed(String value) {
    setState(() {
      // Handle number inputs
      if (RegExp(r'^[0-9]$').hasMatch(value)) {
        displayText += value; // Append numbers to the display text
      }
      // Handle operations
      else if (value == "+" || value == "-" || value == "×" || value == "÷") {
        // If there's already a first number and an operand, compute intermediate result
        if (firstNumber != null && currentOperand.isNotEmpty) {
          performCalculation();
        }
        firstNumber = double.tryParse(displayText); // Set first number
        currentOperand = value; // Set current operation
        displayText = ""; // Clear display for next input
      }
      // Handle "Clear" operation
      else if (value == "C") {
        displayText = "";
        firstNumber = null;
        currentOperand = "";
      }
      // Handle "=" to calculate final result
      else if (value == "=") {
        performCalculation();
        currentOperand = ""; // Reset operand
      }
    });
  }

  // Performs calculation based on the current operand
  void performCalculation() {
    double? secondNumber = double.tryParse(displayText);
    if (firstNumber == null || secondNumber == null) return;

    double result;
    switch (currentOperand) {
      case "+":
        result = firstNumber! + secondNumber;
        break;
      case "-":
        result = firstNumber! - secondNumber;
        break;
      case "×":
        result = firstNumber! * secondNumber;
        break;
      case "÷":
        if (secondNumber == 0) {
          displayText = "Error"; // Handle division by zero
          return;
        }
        result = firstNumber! / secondNumber;
        break;
      default:
        result = 0;
    }

    displayText = result.toString();
    firstNumber = result; // Store result for further calculations
  }

  @override
  Widget build(BuildContext context) {
    ScreenHelper.init(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Padding(
          padding: EdgeInsets.only(top: 35.0, right: 15),
          child: Text(
            'CALCULATOR',
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
            padding: const EdgeInsets.only(top: 35, right: 90),
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
        height: ScreenHelper.h(0.8),
        decoration: BoxDecoration(
          color: Colors.black,
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
            // Display section
            Container(
              padding: EdgeInsets.all(ScreenHelper.w(0.05)),
              alignment: Alignment.centerRight,
              child: Text(
                displayText.isEmpty ? "0" : displayText, // Default display to 0
                style: GoogleFonts.ubuntu(
                  textStyle: const TextStyle(
                    fontSize: 48,
                    color: Colors.white60,
                  ),
                ),
              ),
            ),
            // Buttons section
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                padding: EdgeInsets.all(ScreenHelper.w(0.02)),
                children: [
                  buildCalcButton("7"),
                  buildCalcButton("8"),
                  buildCalcButton("9"),
                  buildCalcButton("÷"),
                  buildCalcButton("4"),
                  buildCalcButton("5"),
                  buildCalcButton("6"),
                  buildCalcButton("×"),
                  buildCalcButton("1"),
                  buildCalcButton("2"),
                  buildCalcButton("3"),
                  buildCalcButton("-"),
                  buildCalcButton("C"),
                  buildCalcButton("0"),
                  buildCalcButton("="),
                  buildCalcButton("+"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Builds individual calculator buttons
  Widget buildCalcButton(String text) {
    return GestureDetector(
      onTap: () => buttonPressed(text),
      child: Container(
        margin: EdgeInsets.all(ScreenHelper.w(0.01)),
        decoration: BoxDecoration(
          color: Colors.deepOrange,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.ubuntu(
              textStyle: const TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
