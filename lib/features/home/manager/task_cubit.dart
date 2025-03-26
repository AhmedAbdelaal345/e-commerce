// ignore_for_file: avoid_print

import 'package:final_projects/features/home/data/repo/home_repo.dart';
import 'package:final_projects/features/home/manager/task_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskCubit extends Cubit<TaskState> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  TaskCubit() : super(TaskInitial());

  static TaskCubit get(context) => BlocProvider.of(context);
  final AddTaskRepo taskRepo = AddTaskRepo();

  void addTask() async {
    emit(TaskLoading());

    final response = await taskRepo.addTask(
        title: titleController.text, description: descriptionController.text);

    response.fold(
      (error) {
        print("Task Add Failed: $error");
        emit(TaskError(error));
      },
      (task) => emit(TaskSuccess(task)),
    );
  }
}