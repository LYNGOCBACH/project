import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoflutter/data/database.dart';

class ToDoDatabaseService {
  final CollectionReference toDoCollection =
      FirebaseFirestore.instance.collection('TodoList');

  Future<void> createNewTodo(String taskName) async {
    try {
      await toDoCollection.add({
        'taskName': taskName,
        'taskCompleted': false,
        'Times': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print("Error adding todo: $e");
    }
  }

  Future<void> updateTask(String id, bool newCompleteTask) async {
    await toDoCollection.doc(id).update({
      'taskCompleted': newCompleteTask,
    });
  }

  Future<void> deleteTodo(String id) async {
    await toDoCollection.doc(id).delete();
  }

  Stream<List<ToDoTask>> listTodo() {
    return toDoCollection
        .orderBy('Times', descending: true)
        .snapshots()
        .map(todoFromFirestore);
  }

  List<ToDoTask> todoFromFirestore(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

      return ToDoTask(
        id: doc.id,
        taskName: data?['taskName'] ?? '',
        taskCompleted: data?['taskCompleted'] ?? false,
      );
    }).toList();
  }
}