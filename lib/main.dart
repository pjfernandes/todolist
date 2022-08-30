import 'dart:math';

import 'package:flutter/material.dart';
import 'task.dart';
import 'task_list.dart';
import 'task_form.dart';

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
    Task(id: 5, name: "sleep", hour: "19:00"),
    Task(id: 6, name: "gym", hour: "20:00"),
    Task(id: 7, name: "eat", hour: "21:00"),
    Task(id: 8, name: "study", hour: "22:00"),
  ];

  void _addTask(String task, String hour) {
    Task newTask =
        Task(id: _tasks[_tasks.length - 1].id + 1, name: task, hour: hour);
    setState(() {
      _tasks.add(newTask);
    });
  }

  _openForm(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TaskForm(_addTask);
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
            children: [
              TaskList(_tasks),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => _openForm(context),
            backgroundColor: Color.fromARGB(255, 187, 19, 7),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
