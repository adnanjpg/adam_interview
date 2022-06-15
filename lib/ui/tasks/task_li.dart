import 'package:flutter/material.dart';

import '../../models/task.dart';

class TaskLi extends StatelessWidget {
  final Task task;
  const TaskLi({
    required this.task,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.name),
      subtitle: Text(task.description),
    );
  }
}
