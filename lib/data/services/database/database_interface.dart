import 'package:todo_with_freezed_bloc/data/models/todo_list.dart';

abstract class DataBaseServiceInterface{

  save(ToDoList toDoList);
  delete(String id);
  getList(String id);
  getAllLists();
  addExampleJobsForFirstLunch();
}