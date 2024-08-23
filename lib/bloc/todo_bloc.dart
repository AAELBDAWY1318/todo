import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:try_again/data/models/task.dart';
import 'package:try_again/data/repositories/task_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TaskRepository taskRepository;
  TodoBloc({required this.taskRepository}) : super(TodoInitial()) {
    on<AddNewTaskEvent>(addNewTask);
    on<DeleteTaskEvent>(deleteTask);
    on<MoveToCompleteEvent>(moveTask);
    on<GetAllEvent>(getTasks);
  }

  Future<void> addNewTask(AddNewTaskEvent event, Emitter emit) async {
    Task task = event.task;
    try {
      emit(AddNewTaskLoading());
      await taskRepository.addToBox(boxName: "tasks", task: task);
      emit(AddNewTaskSuccess());
    } catch (e) {
      log(e.toString());
      emit(AddNewTaskFailure());
    }
  }

  Future<void> deleteTask(DeleteTaskEvent event, Emitter emit) async {
    try {
      emit(DeleteTaskLoading());
      await taskRepository.delete(index: event.index, boxName: "tasks");
      emit(DeleteTaskSuccess());
    } catch (e) {
      log(e.toString());
      emit(DeleteTaskFailure());
    }
  }

  Future<void> moveTask(MoveToCompleteEvent event, Emitter emit) async {
    try {
      emit(MoveTaskLoading());
      await taskRepository.moveTask(
          sourceBox: "tasks",
          destinationBox: "complete_tasks",
          index: event.index);
      emit(MoveTaskSuccess());
    } catch (e) {
      log(e.toString());
      emit(MoveTaskFailure());
    }
  }

  Future<void> getTasks(GetAllEvent event, Emitter emit) async {
    try {
      emit(GetTaskLoading());
      List tasks = await taskRepository.getAllTasks(boxName: event.boxName);
      List completeTasks =
          await taskRepository.getAllTasks(boxName: event.boxName2);
      emit(GetTaskSuccess(tasks: tasks , completeTasks));
    } catch (e) {
      log(e.toString());
      emit(GetTaskFailure());
    }
  }
}
