import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:todo_with_freezed_bloc/data/models/todo_list.dart';
import 'package:todo_with_freezed_bloc/data/services/database/database_interface.dart';

part 'to_do_task_cubit.freezed.dart';
part 'to_do_task_state.dart';

class ToDoTaskCubit extends Cubit<ToDoTaskState> {
  final DataBaseService _dbService;
  final Logger _log = Logger();

  ToDoTaskCubit(this._dbService) : super(ToDoTaskState.initial());

  addList({required ToDoList toDoList}) => _dbService.save(toDoList).then((_) => emit(ToDoTaskState.saved()));

  deleteList({required String id}) => _dbService.delete(id).then((_) => emit(ToDoTaskState.deleted()));

  getList({required String id}) {
    ToDoList? list = _dbService.getList(id);
    if (list == null) return emit(ToDoTaskState.listNotFound());
    return emit(ToDoTaskState.listFound(toDoList: list));
  }

  getToDoCollection() {
    List<ToDoList> toDoCollection = _dbService.getAllLists();
    if (toDoCollection.isEmpty) return emit(ToDoTaskState.collectionEmpty());
    return emit(ToDoTaskState.collection(toDoCollection: toDoCollection));
  }
}
