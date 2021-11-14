import 'package:hive/hive.dart';
import 'package:todo_with_freezed_bloc/data/models/todo_list.dart';

import 'database_interface.dart';

const String DATABASE_TASKS = 'tasks';

class HiveService implements DataBaseServiceInterface {
  static final tasksBox = Hive.box<ToDoList>(DATABASE_TASKS);

  @override
  Future<void> save(ToDoList toDoList) async => await tasksBox.put(toDoList.id, toDoList);

  @override
  ToDoList? getList(String id) => tasksBox.get(id);

  @override
  List<ToDoList> getAllLists() => tasksBox.values.toList();

  @override
  delete(String id) => tasksBox.delete(id);

  @override
  addExampleJobsForFirstLunch() {
    // TODO: implement addExampleJobsForFirstLunch
    throw UnimplementedError();
  }
}
