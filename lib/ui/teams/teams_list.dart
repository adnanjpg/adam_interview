import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../prov/employees_prov.dart';
import 'senior_employee_li.dart';

class TeamsList extends ConsumerWidget {
  const TeamsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final val = ref.watch(seniorEmployeesProv);

    return Center(
      child: val.when(
        data: (employees) {
          return ListView.builder(
            itemCount: employees.length,
            itemBuilder: (context, indx) {
              final emp = employees[indx];

              return SeniorEmployeeLI(employee: emp);
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
