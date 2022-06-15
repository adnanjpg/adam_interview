import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../prov/employees_prov.dart';
import 'junior_employee_li.dart';

class EmployeeList extends ConsumerWidget {
  const EmployeeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final val = ref.watch(juniorEmployeesProv);

    return Center(
      child: val.when(
        data: (employees) {
          return ListView.builder(
            itemCount: employees.length,
            itemBuilder: (context, indx) {
              final emp = employees[indx];

              return JuniorEmployeeLI(employee: emp);
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
