import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_flutter_app/data/provider.dart';

import '../../data/models/task_model.dart';

class TaskFormWidget extends StatefulWidget {
  final Task? task;

  const TaskFormWidget({super.key, this.task});

  @override
  State<TaskFormWidget> createState() => _TaskFormWidgetState();
}

class _TaskFormWidgetState extends State<TaskFormWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  DateTime? _dueDate;

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      _titleController = TextEditingController(text: widget.task!.title);
      _descriptionController = TextEditingController(text: widget.task!.description);
      _dueDate = widget.task!.dueDate;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _saveTask() {
    if (_formKey.currentState!.validate() && _dueDate != null) {
      final taskPovider = Provider.of<TaskProvider>(context, listen: false);
      final newTask = Task(
        title: _titleController.text, 
        description: _descriptionController.text, 
        dueDate: _dueDate!);
      
      widget.task == null  ? taskPovider.saveTask(newTask) : taskPovider.updateTask(newTask, widget.task!.key);
      Navigator.pop(context);
    }
  }

  Future<void> _selectDueDate(BuildContext context) async {
    final initialDate = _dueDate ?? DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _dueDate) {
      setState(() {
        _dueDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        labelText: "Title",
                      ),
                      maxLength: 100,
                      validator: (value) {
                        if (value == "" || value == null) {
                          return "Title is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        labelText: "Description",
                      ),
                      maxLines: 4,
                      maxLength: 500,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == "" || value == null) {
                          return "Description is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  
                    const SizedBox(height: 8,),
                    TextButton.icon(
                      onPressed: () => _selectDueDate(context),
                      icon: const Icon(Icons.calendar_month_outlined),
                      label: Text(_dueDate == null ? "Select due date" : _dueDate!.toIso8601String() ),
                    ),
                    ElevatedButton.icon(
                        onPressed: _saveTask,
                        icon: const Icon(Icons.save_alt),
                        label: const Text("Save"))
                  ],
                ),
              ))),
    );
  }
}
