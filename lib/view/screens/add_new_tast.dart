// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_again/bloc/todo_bloc.dart';
import 'package:try_again/constant/app_colors.dart';
import 'package:try_again/data/models/task.dart';
import 'package:try_again/data/repositories/task_repository.dart';
import 'package:try_again/functions/get_date.dart';
import 'package:try_again/functions/get_time.dart';
import 'package:try_again/view/widgets/action_circle.dart';
import 'package:try_again/view/widgets/background.dart';
import 'package:try_again/view/widgets/category_sellector.dart';
import 'package:try_again/view/widgets/custom_button.dart';
import 'package:try_again/view/widgets/custom_text1.dart';
import 'package:try_again/view/widgets/custom_text_field.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key});

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  TextEditingController dateController = TextEditingController();
  TextEditingController timeCotroller = TextEditingController();
  TextEditingController titleCotroller = TextEditingController();
  TextEditingController noteCotroller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String category = "study";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    dateController.dispose();
    timeCotroller.dispose();
    titleCotroller.dispose();
    noteCotroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(taskRepository: TaskRepository()),
      child: BlocConsumer<TodoBloc, TodoState>(
        listener: (context, state) {
          if (state is AddNewTaskLoading) {
            showDialog(
                context: context,
                builder: (context) {
                  return const AlertDialog(
                    content: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  );
                });
          } else if (state is AddNewTaskSuccess) {
            timeCotroller.text = '';
            dateController.text = '';
            titleCotroller.text = '';
            noteCotroller.text = '';
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Success",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                duration: Duration(seconds: 1),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is AddNewTaskFailure) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Failed",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                duration: Duration(seconds: 1),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: Stack(
              children: [
                const Background(pre: 0.13),
                SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Row(
                            children: [
                              ActionCircle(
                                  fun: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icons.close),
                              const Expanded(
                                  child: CustomText1(text: "Add New Task"))
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            "Task Title",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextFormField(
                            controller: titleCotroller,
                            decoration: const InputDecoration(
                              hintText: "Task Title",
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.all(10.0),
                              filled: true,
                              border: OutlineInputBorder(),
                            ),
                            validator: (String? val) {
                              if (val!.isEmpty) {
                                return "Empty";
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              const Text(
                                "Category:  ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              CategorySellector(
                                image: "assets/images/Category.png",
                                fun: () {
                                  category = "study";
                                  setState(() {});
                                  log(category);
                                },
                                select: (category == "study"),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              CategorySellector(
                                image: "assets/images/Category1.png",
                                fun: () {
                                  category = "work";
                                  setState(() {});
                                  log(category);
                                },
                                select: (category == "work"),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              CategorySellector(
                                image: "assets/images/Category2.png",
                                fun: () {
                                  category = "personal";
                                  setState(() {});
                                  log(category);
                                },
                                select: (category == "personal"),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Date",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "Time",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: SizedBox(
                            child: Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    controller: dateController,
                                    hint: "Date",
                                    icon: Icons.date_range,
                                    onTap: () async {
                                      DateTime dateTime =
                                          await getDate(context);
                                      dateController.text =
                                          dateTime.toString().split(' ')[0];
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Expanded(
                                  child: CustomTextField(
                                    controller: timeCotroller,
                                    hint: "Time",
                                    icon: Icons.punch_clock_sharp,
                                    onTap: () async {
                                      TimeOfDay time = await getTime(context);
                                      timeCotroller.text = time.format(context);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            "Note",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 15.0),
                          height: 150, // Custom height for the TextFormField
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Colors.grey),
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            controller: noteCotroller,
                            maxLines: null, // Allows for multiple lines
                            expands: true, // Expands to fill the container
                            validator: (String? val) {
                              if (val!.isEmpty) {
                                return "Empty";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Notes',
                              contentPadding: EdgeInsets.all(16.0),
                              border:
                                  InputBorder.none, // Remove the default border
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        CustomButton(
                            text: "Save",
                            fun: () {
                              if (formKey.currentState!.validate()) {
                                Task task = Task(
                                    title: titleCotroller.text,
                                    body: noteCotroller.text,
                                    date: dateController.text,
                                    time: timeCotroller.text,
                                    category: category);
                                context.read<TodoBloc>().add(
                                      AddNewTaskEvent(task: task),
                                    );
                                
                              }
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
