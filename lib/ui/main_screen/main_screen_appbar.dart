import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../prov/bottom_bar_prov.dart';
import '../employees/create_junior_employee_form.dart';

class MainScreenAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const MainScreenAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomIndex = ref.watch(bottomBarProv);

    return AppBar(
      actions: [
        if (bottomIndex == BottomBarIndex.employees)
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () {
              showMaterialModalBottomSheet(
                context: context,
                builder: (context) {
                  return const CreateJuniorEmployeeForm();
                },
              );
            },
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
