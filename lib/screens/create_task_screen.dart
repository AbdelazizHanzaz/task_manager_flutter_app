import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_flutter_app/data/provider.dart';
import '../widgets/task_form.dart';

class CreateTaskScreen extends StatelessWidget {
  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);

    return  Padding(
        padding: const EdgeInsets.all(16),
        child:
            TaskFormWidget(onSave: (newTask){
              taskProvider.saveTask(newTask);
               Navigator.of(context).pop();
              }),
      );
  }
}
