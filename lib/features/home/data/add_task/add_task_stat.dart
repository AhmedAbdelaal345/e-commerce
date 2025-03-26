import 'package:final_projects/features/home/data/model/task_model.dart';

abstract class TaskState {}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  late final List<TaskModel> tasks;
}

class TaskSuccess extends TaskState {
  final String task;
  TaskSuccess(this.task);
}

class TaskError extends TaskState {
  final String message;
  TaskError(this.message);
}