import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_again/bloc/todo_bloc.dart';
import 'package:try_again/data/repositories/task_repository.dart';
import 'package:try_again/size_config.dart';
import 'package:try_again/view/screens/add_new_tast.dart';
import 'package:try_again/view/widgets/background.dart';
import 'package:try_again/view/widgets/custom_button.dart';
import 'package:try_again/view/widgets/custom_text1.dart';
import 'package:try_again/view/widgets/loading_place_holder.dart';
import 'package:try_again/view/widgets/todo_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig()..init(context);
    return BlocProvider(
      create: (context) => TodoBloc(taskRepository: TaskRepository())
        ..add(
          GetAllEvent(boxName: "tasks", "complete_tasks"),
        ),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            if (state is GetTaskSuccess) {
              List tasks = state.tasks;
              List completeTasks = state.completeTasks;
              log(tasks.toString());
              log(completeTasks.toString());
              return Stack(
                children: [
                  const Background(
                    pre: 0.27,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Center(
                            child: CustomText1(
                                text: DateTime.now().toString().split(' ')[0])),
                      ),
                      const Center(
                        child: Text(
                          "My Todo List",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(15.0),
                        width: double.infinity,
                        height: sizeConfig.screenHeight! * 0.36,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: tasks.isEmpty
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.hourglass_empty,
                                    size: sizeConfig.screenHeight! * 0.08,
                                    color: Colors.grey[300],
                                  ),
                                  const Text(
                                    "EMPTY LIST",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ],
                              )
                            : ListView.separated(
                                itemCount: tasks.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: 2,
                                ),
                                itemBuilder: (context, index) {
                                  return TodoItem(
                                      title: tasks[index].value["title"],
                                      category: tasks[index].value["category"],
                                      complete: false,
                                      onClicked: (val) {
                                        context.read<TodoBloc>().add(
                                              MoveToCompleteEvent(index: index),
                                            );
                                        
                                      });
                                },
                              ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          "Completed",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(15.0),
                        width: double.infinity,
                        height: sizeConfig.screenHeight! * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: completeTasks.isEmpty
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.hourglass_empty,
                                    size: sizeConfig.screenHeight! * 0.08,
                                    color: Colors.grey[300],
                                  ),
                                  const Text(
                                    "EMPTY LIST",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ],
                              )
                            : ListView.separated(
                                itemCount: completeTasks.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: 2,
                                ),
                                itemBuilder: (context, index) {
                                  return TodoItem(
                                      title:
                                          completeTasks[index].value["title"],
                                      category: completeTasks[index]
                                          .value["category"],
                                      complete: true,
                                      onClicked: (val) {});
                                },
                              ),
                      ),
                      CustomButton(
                          text: "Add New Task",
                          fun: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AddNewTask()));
                          }),
                      const Spacer(),
                    ],
                  )
                ],
              );
            } else if (state is GetTaskLoading) {
              return const LoadingPlaceHolder();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
