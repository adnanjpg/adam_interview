import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../prov/tasks_prov.dart';
import 'task_li.dart';

class TaskList extends ConsumerWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final val = ref.watch(tasksProv);

    return Center(
      child: val.when(
        data: (tasks) {
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, indx) {
              final task = tasks[indx];

              return TaskLi(
                task: task,
              );
            },
          );
        },
        error: (error, trace) {
          return const Text('An error occurred');
        },
        loading: () => const Text('Loading...'),
      ),
    );
  }
}
