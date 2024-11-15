import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasksuite/pages/homepage.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Notepage extends StatefulWidget {
  const Notepage({super.key});

  @override
  State<Notepage> createState() => _NotepageState();
}

class _NotepageState extends State<Notepage> {
  final TextEditingController _controller = TextEditingController();
  List<String> notes = [];

  @override
  void initState() {
    super.initState();
    _loadNotes(); // Load saved notes when the page is initialized
  }

  // Load notes from shared preferences
  _loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      notes = prefs.getStringList('notes') ?? [];
    });
  }

  // Save the current list of notes to shared preferences
  _saveNotes() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('notes', notes);
  }

  // Add new note to the list
  _addNote() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        notes.add(_controller.text);
        _controller.clear();
      });
      _saveNotes(); // Save after adding a note
    }
  }

  // Delete a note from the list
  _deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
    _saveNotes(); // Save after deleting a note
  }

  // Edit an existing note
  _editNote(int index) {
    _controller.text = notes[index]; // Load note text into the controller
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Note'),
          content: TextField(
            controller: _controller,
            maxLines: 5,
            decoration: const InputDecoration(hintText: "Edit your note..."),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  notes[index] = _controller.text; // Update the note
                });
                _saveNotes(); // Save after editing the note
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog without saving
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
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
            'NOTES',
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
          children: [
            // Text Field to add new note
            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: "Enter your note...",
                filled: true,
                fillColor: Colors.white10,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addNote,
              child: const Text("Add Note"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
              ),
            ),
            const SizedBox(height: 20),
            // List of saved notes
            Expanded(
              child: ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.black87,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        notes[index],
                        style: GoogleFonts.ubuntu(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit,
                                color: Colors.deepOrange),
                            onPressed: () => _editNote(index),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete,
                                color: Colors.deepOrange),
                            onPressed: () => _deleteNote(index),
                          ),
                        ],
                      ),
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
