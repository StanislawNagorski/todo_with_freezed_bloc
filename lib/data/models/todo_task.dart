import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'todo_task.freezed.dart';

part 'todo_task.g.dart';

@freezed
@HiveType(typeId: 1)
class ToDoTask extends HiveObject with _$ToDoTask {
  @Assert('description.isNotEmpty', 'description cannot be empty')
  factory ToDoTask(
    @HiveField(0) String id, {
    @HiveField(1) required String description,
    @HiveField(2, defaultValue: false) @Default(false) bool isDone,
  }) = _ToDoTask;

  factory ToDoTask.fromJson(Map<String, dynamic> json) => _$ToDoTask(json);
}
