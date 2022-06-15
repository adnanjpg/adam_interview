import '../data/tasks_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/task.dart';

final tasksProv = StreamProvider<List<Task>>(
  (ref) => TasksData.listenToTasks(),
);
