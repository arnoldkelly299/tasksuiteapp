import 'package:flutter/material.dart';

class ScreenHelper {
  static late double screenWidth;
  static late double screenHeight;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
  }

  // Calculate relative height and width
  static double w(double widthPercentage) => screenWidth * widthPercentage;
  static double h(double heightPercentage) => screenHeight * heightPercentage;

  // Optional: Calculate font size relative to screen width
  static double fontSize(double percentage) => screenWidth * percentage;
}
