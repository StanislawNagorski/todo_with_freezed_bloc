import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:todo_with_freezed_bloc/data/models/todo_task.dart';

part 'todo_list.freezed.dart';
part 'todo_list.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 0)
class ToDoList extends HiveObject with _$ToDoList {

  @Assert('lists != null', 'list must be initialized')
  factory ToDoList({
    @HiveField(0) required String id,
    @HiveField(1) String? title,
    @HiveField(2) required List<ToDoTask> lists,
  }) = _ToDoList;

  ToDoList.fromJson(Map<String, dynamic> json) => _$ToDoListFromJson(json);
}
