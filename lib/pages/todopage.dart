import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDopage extends StatefulWidget {
  // final int index;
  // ToDopage({required this.index});
  const ToDopage({super.key});

  @override
  State<ToDopage> createState() => _ToDopageState();
}

class _ToDopageState extends State<ToDopage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'Todopage',
      ),
    );
  }
}
