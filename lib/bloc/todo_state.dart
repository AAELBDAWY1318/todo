part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

class AddNewTaskLoading extends TodoState {}

class AddNewTaskFailure extends TodoState {}

class AddNewTaskSuccess extends TodoState {}

class DeleteTaskLoading extends TodoState {}

class DeleteTaskFailure extends TodoState {}

class DeleteTaskSuccess extends TodoState {}

class GetTaskLoading extends TodoState {}

class GetTaskFailure extends TodoState {}

class GetTaskSuccess extends TodoState {
  final List tasks , completeTasks;

  GetTaskSuccess(this.completeTasks, {required this.tasks});
}

class MoveTaskLoading extends TodoState {}

class MoveTaskFailure extends TodoState {}

class MoveTaskSuccess extends TodoState {}
