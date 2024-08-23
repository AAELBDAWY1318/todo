part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class AddNewTaskEvent extends TodoEvent {
  final Task task;

  AddNewTaskEvent({required this.task});
}

class MoveToCompleteEvent extends TodoEvent {
  final int index;

  MoveToCompleteEvent({required this.index});
}

class DeleteTaskEvent extends TodoEvent {
  final int index;
  DeleteTaskEvent({required this.index});
}

class GetAllEvent extends TodoEvent {
  final String boxName , boxName2;


  GetAllEvent(this.boxName2, {required this.boxName});
}

