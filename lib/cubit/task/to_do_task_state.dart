part of 'to_do_task_cubit.dart';

@freezed
abstract class ToDoTaskState with _$ToDoTaskState{
  factory ToDoTaskState.initial() = _ToDoTaskInitial;
  factory ToDoTaskState.saved({required List<ToDoList> toDoCollection}) = _ToDoTaskSaved;
  factory ToDoTaskState.deleted({required List<ToDoList> toDoCollection}) = _ToDoTaskDeleted;
  // factory ToDoTaskState.listNotFound() = _ToDoTaskListNotFound;
  // factory ToDoTaskState.listFound({required ToDoList toDoList}) = _ToDoTaskListFound;
  factory ToDoTaskState.collectionEmpty() = _ToDoTaskCollectionEmpty;
  factory ToDoTaskState.collectionLoaded({required List<ToDoList> toDoCollection}) = _ToDoTaskCollectionLoaded;

}

