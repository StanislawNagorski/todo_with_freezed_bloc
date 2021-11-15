part of 'to_do_task_cubit.dart';

@freezed
abstract class ToDoTaskState with _$ToDoTaskState{
  factory ToDoTaskState.initial() = _ToDoTaskInitial;
  factory ToDoTaskState.saved() = _ToDoTaskSaved;
  factory ToDoTaskState.deleted() = _ToDoTaskDeleted;
  factory ToDoTaskState.listNotFound() = _ToDoTaskListNotFound;
  factory ToDoTaskState.listFound({required ToDoList toDoList}) = _ToDoTaskListFound;
  factory ToDoTaskState.collectionEmpty() = _ToDoTaskCollectionEmpty;
  factory ToDoTaskState.collection({required List<ToDoList> toDoCollection}) = _ToDoTaskCollection;

}

