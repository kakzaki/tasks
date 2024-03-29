import 'dart:async';

import 'package:tasks/src/core/contracts/bloc_contract.dart';
import 'package:tasks/src/data/models/task_model.dart';
import 'package:tasks/src/data/repositories/task_repository.dart';

class ImportantPageBloc implements BlocContract {
  ImportantPageBloc() {
    this.taskRepository = TaskRepository();
  }

  TaskRepository taskRepository;

  final controllerTasks = StreamController();
  Sink get sinkTasks => controllerTasks.sink;
  Stream get streamTasks => controllerTasks.stream;

  Future<bool> updateTask(TaskModel task) async {
    bool result = await this.taskRepository.update(task.toMap());
    return result;
  }

  Future<void> refreshTasks() async {
    final result = await taskRepository.allImportantTasks();

    List<TaskModel> tasks = <TaskModel>[];
    result.forEach((Map<String, dynamic> task) {
      tasks.add(TaskModel.from(task));
    });

    this.sinkTasks.add(tasks);
  }

  @override
  void dispose() {
    controllerTasks.close();
  }
}
