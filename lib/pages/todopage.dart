import 'dart:math';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasksuite/pages/homepage.dart';
import 'calpage.dart';
import 'notepage.dart';
import 'stopwatchpage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_eva_icons/flutter_eva_icons.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import '';
// import 'package:tasksuite/tools/curvedbuttomnav.dart';

// import ' ';

class Todopage extends StatefulWidget {
  // ignore: use_super_parameters
  const Todopage({Key? key}) : super(key: key);

  @override
  State<Todopage> createState() => _TodopageState();
}

class _TodopageState extends State<Todopage> {
  List<String> _tasks = []; // List to store tasks
  final TextEditingController _taskController =
      TextEditingController(); // Controller for input field
  List<bool> _completedTasks = []; // List to track completed tasks

//    int myIndex = 0;
//   List<Widget> widgetList = const [
// Todopage(),
// Calpage(),
// Notepage(),
// Stopwatchpage(),
//   ];

  @override
  void initState() {
    super.initState();
    _loadTasks(); // Load tasks when the app starts
  }

  // Load tasks from shared preferences
  Future<void> _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _tasks =
          List<String>.from(prefs.getStringList('tasks') ?? []); // Mutable list
      _completedTasks = List<bool>.from(
          prefs.getStringList('completedTasks')?.map((e) => e == 'true') ?? []);
    });
  }

  // Save tasks to shared preferences
  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('tasks', _tasks); // Save task list
    await prefs.setStringList(
        'completedTasks',
        _completedTasks
            .map((e) => e.toString())
            .toList()); // Save completed states
  }

  void _addTask(String task) {
    setState(() {
      _tasks.add(task); // Add new task
      _completedTasks.add(false); // Initially, the task is not completed
      _taskController.clear(); // Clear input field
    });
    _saveTasks(); // Save tasks
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
      _completedTasks.removeAt(index);
    });
    _saveTasks(); // Save tasks after removing
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Padding(
          padding: EdgeInsets.only(top: 35.0, right: 20),
          child: Text(
            'TO-DO',
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
        child: Column(
          // Opening bracket for Column
          children: [
            const SizedBox(height: 50),
            Padding(
              // Opening bracket for Padding

              padding: const EdgeInsets.all(20.0),
              child: Row(
                // Opening bracket for Row
                children: [
                  Expanded(
                    // Opening bracket for Expanded
                    child: TextField(
                      // Opening bracket for TextField
                      controller: _taskController, // Assigning the controller
                      decoration: InputDecoration(
                        hintText: 'Enter a new task',
                        focusColor: Colors.deepOrange,
                        filled: true,
                        fillColor: Colors.grey[800],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ), // Closing bracket for OutlineInputBorder
                      ), // Closing bracket for InputDecoration
                    ), // Closing bracket for TextField
                  ), // Closing bracket for Expanded
                  IconButton(
                    // Opening bracket for IconButton
                    icon: const Icon(Icons.add, color: Colors.deepOrange),
                    onPressed: () {
                      if (_taskController.text.isNotEmpty) {
                        print(
                            "Adding Task: ${_taskController.text}"); // Debugging
                        setState(() {
                          _tasks.add(
                              _taskController.text); // Add the task to the list
                          _completedTasks.add(
                              false); // Add a new entry for the completed status
                          _taskController.clear(); // Clear input field
                          _saveTasks(); // Save tasks after adding
                        });
                      }
                    },
                  ), // Closing bracket for IconButton
                ], // Closing bracket for children of Row
              ), // Closing bracket for Row
            ), // Closing bracket for Padding
            Expanded(
              // Opening bracket for Expanded
              child: ListView.builder(
                // Opening bracket for ListView.builder
                itemCount: _tasks.length, // Number of tasks to display
                itemBuilder: (context, index) {
                  // Opening bracket for itemBuilder
                  return ListTile(
                    leading: Checkbox(
                      value: _completedTasks[
                          index], // Checkbox value based on task completion status
                      onChanged: (bool? value) {
                        setState(() {
                          _completedTasks[index] =
                              value!; // Update the completion status
                          _saveTasks(); // Save tasks after updating
                        });
                      },
                    ),
                    // Opening bracket for ListTile
                    title: Text(
                      // Opening bracket for Text
                      _tasks[index], // Display the task
                      style: TextStyle(
                          color: Colors.white60,
                          decoration: _completedTasks[index]
                              ? TextDecoration
                                  .lineThrough // Strikethrough if completed
                              : TextDecoration.none,
                          decorationColor: Colors.deepOrange,
                          fontSize: 20), // Closing bracket for TextStyle
                    ),
                    trailing: IconButton(
                      // Opening bracket for IconButton
                      icon: const Icon(LineAwesomeIcons.trash_alt_solid,
                          color: Colors.deepOrange),
                      onPressed: () {
                        setState(() {
                          _tasks.removeAt(index); // Remove the task
                          _completedTasks.removeAt(index);
                          _saveTasks(); // Save tasks after deletion
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
