import 'dart:math';

import 'package:flutter/material.dart';

import '../../data/models/task_model.dart';

class TaskWidget extends StatefulWidget {
  final Task task;

  const TaskWidget({super.key, required this.task});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, -1.0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _markAsCompleted() {
    setState(() {
      _isCompleted = true;
    });

    _animationController.forward().then((_) {
      // You can perform any additional actions after the animation completes
      // For example, update the task as completed in the provider
    });
  }

  @override
  Widget build(BuildContext context) {
    final task = widget.task;

    final cardColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];

    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: Card(
          color: cardColor,
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Due Date: ${task.dueDate}',
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  task.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16.0),
                //if (!_isCompleted)
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Opacity(
                        opacity: 1.0 - _opacityAnimation.value,
                        child: child,
                      );
                    },
                    child: ElevatedButton(
                      onPressed: _markAsCompleted,
                      child: const Text('Mark as Completed'),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
