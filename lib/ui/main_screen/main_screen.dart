import 'package:flutter/material.dart';

import 'main_screen_appbar.dart';
import 'main_screen_body.dart';
import 'main_screen_bottom_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainScreenAppBar(),
      body: MainScreenBody(),
      bottomNavigationBar: MainScreenBottomBar(),
    );
  }
}
