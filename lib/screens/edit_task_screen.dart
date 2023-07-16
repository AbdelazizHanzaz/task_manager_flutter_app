import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/models/task_model.dart';
import '../data/provider.dart';
import '../widgets/task_form.dart';


class EditTaskScreen extends StatelessWidget {
  final Task taskToEdit;

  const EditTaskScreen({super.key, required this.taskToEdit});

 
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    return Padding(
        padding: const EdgeInsets.all(16),
        child: TaskFormWidget(
          onSave: (Task editedTask) => taskProvider.updateTask(editedTask),
          initialTask: taskToEdit,
        ),
      );
  }
}
