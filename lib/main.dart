import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ui/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF53BF9D);

    return MaterialApp(
      theme: ThemeData(
        primaryColor: primary,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          secondary: Color(0xFFF94C66),
          onSecondary: Colors.black,
          background: Color(0xFFFFC54D),
          onBackground: Colors.black,
          error: Colors.red,
          onError: Colors.white,
          surface: Color(0xFFBD4291),
          onSurface: Color(0xFFFFFFFF),
          primary: primary,
          onPrimary: Colors.black,
        ),
      ),
      home: const MainScreen(),
    );
  }
}
