import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:simple_to_do_app/model/task_model.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final Box<TaskModel> _box;
  
  TaskCubit() : _box = Hive.box<TaskModel>('tasksBox'), super(TaskInitial()) {
    loadTasks();
  }

  void loadTasks() {
    final tasks = _box.values.toList().cast<TaskModel>();
    emit(TasksLoaded(tasks));
  }


  void addTask(TaskModel task) async {
    await _box.add(task);
    loadTasks();
  }

  void deleteTask(TaskModel task) async {
    await _box.delete(task.key);
    loadTasks();
  }

  void deleteAllTasks() async {
    await _box.clear();
    loadTasks();
  }

  void updateTask (TaskModel task) async {
    task.isComplete = !task.isComplete;
    await task.save();
    loadTasks();
  }
}
