import '../prov/bottom_bar_prov.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreenBody extends ConsumerWidget {
  const MainScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(bottomBarProv);

    return selectedIndex.body;
  }
}
