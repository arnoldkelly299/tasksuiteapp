import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Calpage extends StatefulWidget {
  const Calpage({super.key});

  @override
  State<Calpage> createState() => _CalpageState();
}

class _CalpageState extends State<Calpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('calculator'),
    );
  }
}
