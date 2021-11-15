import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_freezed_bloc/cubit/task/to_do_task_cubit.dart';
import 'package:todo_with_freezed_bloc/data/models/todo_list.dart';

class TodoCollectionListView extends StatelessWidget {
  final List<ToDoList> todoCollection;

  const TodoCollectionListView({Key? key, required this.todoCollection}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: todoCollection.length,
        itemBuilder: (context, index) {
          ToDoList toDoList = todoCollection[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
            child: GestureDetector(
              onLongPress: () => BlocProvider.of<ToDoTaskCubit>(context, listen: false).deleteList(id: toDoList.id),
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text('${toDoList.title} id: ${toDoList.id}'),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
