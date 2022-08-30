import 'package:flutter/material.dart';

class TaskForm extends StatefulWidget {
  final void Function(String, String) onSubmit;
  TaskForm(this.onSubmit);

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final nameController = TextEditingController();
  final hourController = TextEditingController();

  _submitForm() {
    final name = nameController.text;
    final hour = hourController.text;

    widget.onSubmit(name, hour);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: hourController,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(labelText: 'Hora'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: _submitForm,
                child: Text('New task'),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 239, 31, 16)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
