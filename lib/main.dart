import 'package:flutter/material.dart';
import 'package:tasksuite/startup/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

// This widget is the root of your application.

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TASKSUITE-APP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Splashscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _HomePageState();
}

class _HomePageState extends State<MyHomePage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  // int currentIndex = 0;
  // final screens = const [
  //   Center(
  //     child: Text(
  //       'HOME SCREEN',
  //       style: TextStyle(fontSize: 40),
  //     ),
  //   ),
  //   Center(
  //     child: Text(
  //       'PROFILE SCREEN',
  //       style: TextStyle(fontSize: 40),
  //     ),
  //   ),
  //   Center(
  //     child: Text(
  //       'STORE SCREEN',
  //       style: TextStyle(fontSize: 40),
  //     ),
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      // body: screens[currentIndex],

      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Appcolors.primaryWhite,
      //   selectedItemColor: Appcolors.primaryOrange,
      //   unselectedItemColor: Appcolors.primaryBlack,
      //   iconSize: 20,
      //   selectedFontSize: 25,
      //   currentIndex: currentIndex,
      //   onTap: (index) {
      //     setState(() {
      //       currentIndex = index;
      //     });
      //   },
      //   // items: const [
      //   //   BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //   //   BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Home'),
      //   //   BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Home'),
      //   // ],
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
