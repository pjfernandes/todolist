import 'task.dart';
import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;
  final void Function(int) onRemove;

  const TaskList(this.tasks, this.onRemove);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Widget> taskToCard() {
    List<Widget> taskList = [];

    for (Task task in widget.tasks) {
      taskList.add(
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: SizedBox(
                width: 150,
                height: 80,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "#" + task.id.toString(),
                              style: TextStyle(color: Colors.grey),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "  " + task.name.toUpperCase() + "   ",
                              style: TextStyle(color: Colors.red),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              task.hour,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () => widget.onRemove(task.id),
                            child: Text('Done'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
    return taskList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: taskToCard(),
    );
  }
}
