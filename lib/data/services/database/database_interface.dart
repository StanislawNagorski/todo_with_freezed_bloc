import 'package:todo_with_freezed_bloc/data/models/todo_list.dart';

abstract class DataBaseService{

  Future<void> save(ToDoList toDoList);
  Future<void> delete(String id);
  ToDoList? getList(String id);
  List<ToDoList> getAllLists();
  addExampleJobsForFirstLunch();
}