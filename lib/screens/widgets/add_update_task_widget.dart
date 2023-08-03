

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_flutter_app/data/provider.dart';
import 'package:task_manager_flutter_app/screens/widgets/task_form.dart';

import '../../data/models/task_model.dart';

class AddUpdateTaskWidget extends StatelessWidget {

  final Task? task;

  const AddUpdateTaskWidget({super.key, this.task});

  @override
  Widget build(BuildContext context) {
    return TaskFormWidget(task: task);
  }
}