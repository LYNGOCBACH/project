import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoflutter/util/todo_database_service.dart';
import '../data/database.dart';
import '../util/dialog_box.dart';
import '../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final _myBox = Hive.box('mybox');
  final ToDoDataBase db = ToDoDataBase();
  final ToDoDatabaseService db2 = ToDoDatabaseService();

  @override
  void initState() {

    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      
      db.loadData();
    }

    super.initState();
  }

  // Text controller
  final _controller = TextEditingController();

  // Checkbox 
  void checkBoxChanged(bool value, int index) {
    // Update Cloud Firestore
    db2.updateTask(db.toDoList[index].id, value);
  }

  // Save new task
void saveNewTask() async {
  await db2.createNewTodo(_controller.text);
  _controller.clear();
  Navigator.of(context).pop();

  // setstate Cloud Firestore
  await db2.listTodo().listen((List<ToDoTask> data) {
    setState(() {
      db.toDoList = data;
    });
  });
}


  // Create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // Delete task
  void deleteTask(int index) {
    // Delete Cloud Firestore
    db2.deleteTodo(db.toDoList[index].id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Center(child: Text('TO DO')),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            
            Scaffold.of(context).openDrawer();
          },
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
            body: StreamBuilder<List<ToDoTask>>(
        stream: db2.listTodo(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<ToDoTask> todoList = snapshot.data!;

          return ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, index) {
              return ToDoTile(
                taskName: todoList[index].taskName,
                taskCompleted: todoList[index].taskCompleted,
                id: todoList[index].id,
                onChanged: (value) => checkBoxChanged(value!, todoList[index].id as int),
                deleteFunction: (context) => deleteTask(todoList[index].id as int),
              );
            },
          );
        },
      ),
    );
  }
}