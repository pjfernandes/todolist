import 'dart:ui';

import 'package:flutter/material.dart';
import 'task.dart';
import 'task_list.dart';
import 'task_form.dart';

void main() {
  runApp(
    TodoApp(),
  );
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Task> _tasks = [];

  List<Task> get getTasks {
    return _tasks;
  }

  void _addTask(String task, String hour) {
    Task newTask = Task(
        id: _tasks.length == 0 ? 1 : _tasks[_tasks.length - 1].id + 1,
        name: task,
        hour: hour);

    setState(() {
      _tasks.add(newTask);
    });

    Navigator.of(context).pop();
  }

  void _removeTask(int id) {
    setState(() {
      _tasks.removeWhere((element) => element.id == id);
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
        backgroundColor: Colors.orange,
      ),
      body: _tasks.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.orange,
                    ),
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "You don't have tasks to do",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : SizedBox(
              height: 430,
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (ctx, index) {
                  final tr = _tasks[index];
                  return TaskList(_tasks, _removeTask);
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openForm(context),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
