import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class ToDoTask {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String taskName;

  @HiveField(2)
  late bool taskCompleted;

  ToDoTask({
    required this.id,
    required this.taskName,
    required this.taskCompleted,
  });
}

class ToDoDataBase {
  List<ToDoTask> toDoList = [];
  final _myBox = Hive.box('mybox');

  // Run
  void createInitialData() {
    toDoList = [
      // ToDoTask(id: "1", taskName: "Ly Ngoc Bach", taskCompleted: false),
      // ToDoTask(id: "2", taskName: "2121051137", taskCompleted: false),
    ];
  }

  // tải dữ liệu từ database
void loadData() {
  final dynamic loadedData = _myBox.get("TODOLIST", defaultValue: <ToDoTask>[]);
  if (loadedData is List<ToDoTask>) {
    toDoList = loadedData;
  }
}

  // Update the database
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}

