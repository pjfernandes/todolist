import 'package:flutter/widgets.dart';

import 'task.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;

  const TaskList(this.tasks);

  List<Widget> taskToCard() {
    List<Widget> taskList = [];
    for (Task task in tasks) {
      taskList.add(
        Center(
          child: Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.grey,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: SizedBox(
              width: 150,
              height: 50,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "#" + task.id.toString(),
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      task.name.toUpperCase(),
                      style: TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        task.hour,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
    return taskList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: taskToCard(),
    );
  }
}
