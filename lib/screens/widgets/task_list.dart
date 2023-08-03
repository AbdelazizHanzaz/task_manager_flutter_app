import 'package:flutter/material.dart';
import 'package:task_manager_flutter_app/routes/app_routes.dart';
import 'package:task_manager_flutter_app/screens/widgets/task_card_item.dart';

import '../../data/models/task_model.dart';


class TaskList extends StatelessWidget {
  final List<Task> tasks;

  const TaskList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index){
                      final task = tasks[index];
                      return InkWell(
                        onTap: () => Navigator.pushNamed(context, AppRouters.taskDetails, arguments: task),
                        child: TaskCard(task: task),
                      );
                }
                );
  }
}
