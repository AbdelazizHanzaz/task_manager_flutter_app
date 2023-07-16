import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/models/task_model.dart';
import '../data/provider.dart';

class TaskPopupWidget extends StatefulWidget {
  const TaskPopupWidget({super.key});

  @override
  State<TaskPopupWidget> createState() => _TaskPopupWidgetState();
}

class _TaskPopupWidgetState extends State<TaskPopupWidget> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late DateTime _dueDate;
  late FocusNode _descriptionFocusNode;


  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _dueDate = DateTime.now();
    _descriptionFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
        _descriptionFocusNode.dispose();

    super.dispose();
  }

  void _addTask() {
    final title = _titleController.text;
    final description = _descriptionController.text;

    final newTask = Task(
      title: title,
      description: description,
      dueDate: _dueDate,
      isCompleted: false,
    );

    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    taskProvider.saveTask(newTask);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Close the popup when tapping outside the content
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Add Task',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
                const SizedBox(height: 16),
                const Text('Due Date'),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: _dueDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
      
                    if (pickedDate != null) {
                      setState(() {
                        _dueDate = pickedDate;
                      });
                    }
                  },
                  child: const Text('Select due date'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _addTask,
                  child: const Text('Add Task'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
