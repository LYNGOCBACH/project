import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todoflutter/util/edit_task_screen.dart';
import 'package:todoflutter/util/todo_database_service.dart';

class ToDoTile extends StatelessWidget {
  final String id;
  final String? taskName;
  final bool? taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  

  ToDoTile({
    super.key,
    required this.id,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction, required void Function(dynamic context) editFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (deleteFunction) async {
                await ToDoDatabaseService().deleteTodo(id);
              },
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // checkbox
              Checkbox(
                value: taskCompleted,
                onChanged: (onChanged) {
                  bool? newCompleteTask = onChanged;
                  ToDoDatabaseService().updateTask(id, newCompleteTask!);
                },
                activeColor: Colors.black,
              ),

              // task name
              Text(
                taskName ?? '',
                style: TextStyle(
                  decoration: taskCompleted!
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditTaskScreen(
                        id: id,
                        taskName: taskName,
                      ),
                    ),
                  );
                },
                child: Icon(
                  Icons.edit,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
