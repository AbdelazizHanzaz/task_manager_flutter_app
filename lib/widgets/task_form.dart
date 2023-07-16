import 'package:flutter/material.dart';

import '../data/models/task_model.dart';

class TaskFormWidget extends StatefulWidget {
  final void Function(Task) onSave;
  final Task? initialTask;

  const TaskFormWidget({
    super.key,
    required this.onSave,
    this.initialTask,
  });

  @override
  State<TaskFormWidget> createState() => _TaskFormWidgetState();
}

class _TaskFormWidgetState extends State<TaskFormWidget> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  //late TextEditingController _dueDateController;
  DateTime? _dueDate;


  @override
  void initState() {
    super.initState();
    _titleController =
        TextEditingController(text: widget.initialTask?.title ?? '');
    _descriptionController =
        TextEditingController(text: widget.initialTask?.description ?? '');
    // _dueDateController = TextEditingController(
    //     text: widget.initialTask?.dueDate != null
    //         ? widget.initialTask!.dueDate.toString()
    //         : '');
    _dueDate = widget.initialTask?.dueDate;

  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    //_dueDateController.dispose();
    super.dispose();
  }

  void _saveTask() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }

    final title = _titleController.text;
    final description = _descriptionController.text;
    //final dueDate = DateTime.parse(_dueDateController.text);

    if (title.isNotEmpty && description.isNotEmpty) {
      final editedTask = Task(
        title: title,
        description: description,
        dueDate: _dueDate!,
        isCompleted: widget.initialTask?.isCompleted ?? false,
      );
      widget.onSave(editedTask);
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
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Title cannot be empty';
                  }
                  return null;
                }
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
                validator: (value) {
                   if (value!.isEmpty) {
                     return 'Description cannot be empty';
                   }
                   return null;
                },
              ),
              const SizedBox(
                height: 40,
              ),
              // TextFormField(
              //   controller: _dueDateController,
              //   decoration: const InputDecoration(
              //     labelText: 'Due Date',
              //   ),
              //   validator: (value){
              //     if(value!.isEmpty){
              //       return 'Please enter a valid date';
              //     }
              //     return null;
              //   },
              // ),
              GestureDetector(
            onTap: () => _selectDueDate(context),
            child: InputDecorator(
              decoration: const InputDecoration(
                //labelText: 'Due Date',
                hintText: 'Select due date',
              ),
              isEmpty: _dueDate == null,
              child: Text(
                _dueDate != null ? _dueDate.toString() : 'Select due date',
              ),
            ),
          ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: _saveTask,
                child: const Text('Save'),
              ),
            ],
          )),
    );
  }
}
