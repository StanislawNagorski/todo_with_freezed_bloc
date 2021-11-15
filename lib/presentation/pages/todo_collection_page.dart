import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_freezed_bloc/cubit/task/to_do_task_cubit.dart';
import 'package:todo_with_freezed_bloc/data/models/todo_list.dart';
import 'package:todo_with_freezed_bloc/presentation/widgets/collection_list_view.dart';
import 'package:uuid/uuid.dart';

class ToDoCollectionPage extends StatelessWidget {
  const ToDoCollectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ToDoTaskCubit cubit = BlocProvider.of<ToDoTaskCubit>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your awesome To Do Lists Collection"),
      ),
      body: BlocConsumer<ToDoTaskCubit, ToDoTaskState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state.when(
            initial: () => initPage(context),
            saved: (toDoCollection) => TodoCollectionListView(todoCollection: toDoCollection),
            deleted: (toDoCollection) => TodoCollectionListView(todoCollection: toDoCollection),
            // listNotFound: listNotFound,
            // listFound: (toDoList) {},
            collectionEmpty: () => returnEmptyCollectionInfo('You have no list. Add one! :)'),
            collectionLoaded: (toDoCollection) => TodoCollectionListView(todoCollection: toDoCollection),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cubit.addList(toDoList: ToDoList(const Uuid().v4(), title: 'TestList', lists: []));
        },
      ),
    );
  }

  Widget initPage(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('Get lists'),
        onPressed: () => getToDoCollection(context),
      ),
    );
  }

  getToDoCollection(BuildContext context) {
    ToDoTaskCubit cubit = BlocProvider.of<ToDoTaskCubit>(context);
    cubit.getToDoCollection();
  }


  returnEmptyCollectionInfo(String message) {
    return Center(
      child: Text(message),
    );
  }
}
