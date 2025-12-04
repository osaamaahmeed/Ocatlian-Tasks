part of 'task_cubit.dart';

sealed class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

final class TaskInitial extends TaskState {}

final class TasksLoaded extends TaskState {
  final List<TaskModel> tasks;
  const TasksLoaded(this.tasks);

  @override
  List<Object> get props => [tasks];
}

