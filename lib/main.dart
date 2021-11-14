import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_with_freezed_bloc/data/models/todo_list.dart';
import 'package:todo_with_freezed_bloc/data/models/todo_task.dart';

import 'data/services/database/hive_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter().whenComplete(() {
    Hive
      ..registerAdapter(ToDoListAdapter())
      ..registerAdapter(ToDoTaskAdapter());
  });
  await Hive.openBox<ToDoList>(DATABASE_TASKS);

  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To do list',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(),
    );
  }
}
