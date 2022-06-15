import '../../models/junior_employee.dart';
import '../employees/junior_employee_li.dart';

import '../../data/employees_data.dart';
import '../../models/senior_employee.dart';
import 'package:flutter/material.dart';

class SeniorEmployeeLI extends StatefulWidget {
  final SeniorEmployee employee;
  const SeniorEmployeeLI({
    required this.employee,
    Key? key,
  }) : super(key: key);

  @override
  State<SeniorEmployeeLI> createState() => _SeniorEmployeeLIState();
}

class _SeniorEmployeeLIState extends State<SeniorEmployeeLI> {
  SeniorEmployee get senior => widget.employee;

  List<JuniorEmployee>? _juniors;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(senior.name),
      children: [
        SizedBox(
          height: 150,
          child: FutureBuilder(
            future: EmployeesData.getSeniorsEmployees(senior),
            builder: (context, snp) {
              if (snp.connectionState == ConnectionState.waiting) {
                return const Text('Loading...');
              }

              if (snp.hasError) {
                return const Text('An error occurred');
              }

              if (snp.data != null) {
                _juniors = snp.data as List<JuniorEmployee>;

                if (_juniors!.isNotEmpty) {
                  return ListView.builder(
                    itemCount: _juniors!.length,
                    itemBuilder: (context, indx) {
                      final junior = _juniors![indx];

                      return JuniorEmployeeLI(employee: junior);
                    },
                  );
                }
              }

              return const Text('No juniors');
            },
          ),
        ),
      ],
    );
  }
}
