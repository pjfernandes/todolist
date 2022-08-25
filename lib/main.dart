import 'package:flutter/material.dart';
import 'task.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Task> _tasks = [
    Task(id: 1, name: "sleep", hour: "19:00"),
    Task(id: 2, name: "gym", hour: "20:00"),
    Task(id: 3, name: "eat", hour: "21:00"),
    Task(id: 4, name: "study", hour: "22:00"),
  ];

  void _addTask(int id, String task, String hour) {
    Task newTask = Task(id: id, name: task, hour: hour);
    setState(() {
      _tasks.add(newTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('To do List'),
          backgroundColor: Color.fromARGB(255, 187, 19, 7),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: _tasks,
          ),
        ));
  }
}
