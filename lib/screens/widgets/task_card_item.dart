
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_flutter_app/screens/widgets/add_update_task_widget.dart';

import '../../data/models/task_model.dart';
import '../../data/provider.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  const TaskCard({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    return Card(
      child: ListTile(
        leading: Checkbox(
            value: task.isCompleted,
            onChanged: (value) => taskProvider.markTask(task, value!)),
        title: Text(task.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleMedium,),
        subtitle: Text(task.description, maxLines: 2, overflow: TextOverflow.ellipsis),
        trailing: PopupMenuButton<String>(
            onSelected: (value){
               value == "edit" ? showModalBottomSheet(
                useSafeArea: true,
                isScrollControlled: true,
                context: context, builder: (context) => AddUpdateTaskWidget(task: task)) 
                : taskProvider.softDeleteTask(task, true);
            },
            itemBuilder: ((context) => [
                  const PopupMenuItem<String>(
                      value: "edit",
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.edit),
                          SizedBox(width: 16,),
                          Text("Edit")
                        ],
                      )),
                  const PopupMenuItem<String>(
                      value: "delete",
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.delete),
                          SizedBox(width: 16,),
                          Text("Delete")
                        ],
                      ))
                ])),
      ),
    );
  }
}
