import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../prov/bottom_bar_prov.dart';

class MainScreenBottomBar extends ConsumerWidget {
  const MainScreenBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
      onTap: (e) {
        ref.read(bottomBarProv.notifier).state = BottomBarIndex.values[e];
      },
      currentIndex: ref.watch(bottomBarProv).index,
      items: BottomBarIndex.values
          .map(
            (e) => BottomNavigationBarItem(
              icon: Icon(e.icon),
              label: e.title,
            ),
          )
          .toList(),
    );
  }
}
