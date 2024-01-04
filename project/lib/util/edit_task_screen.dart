import 'package:flutter/material.dart';
import 'package:todoflutter/util/todo_database_service.dart';

class EditTaskScreen extends StatefulWidget {
  final String id;
  final String? taskName;

  EditTaskScreen({
    required this.id,
    required this.taskName,
  });

  @override
  _EditTaskScreenState createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late TextEditingController _controller;
  late String originalTaskName;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.taskName);
    originalTaskName = widget.taskName ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Task Name'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
  onPressed: () async {
    String newTaskName = _controller.text.trim();
    
    // Check 
    if (newTaskName != originalTaskName) {
      // Update lên csdl
      await ToDoDatabaseService().updateEditTask(
        widget.id,
        newTaskName as String, // đổi tên
      );
    }

    Navigator.of(context).pop();
  },
  child: Text('Save Changes'),
),

          ],
        ),
      ),
    );
  }
}

