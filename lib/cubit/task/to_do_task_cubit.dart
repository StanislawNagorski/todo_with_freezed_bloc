import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'to_do_task_state.dart';

class ToDoTaskCubit extends Cubit<ToDoTaskState> {
  ToDoTaskCubit() : super(ToDoTaskInitial());
}
