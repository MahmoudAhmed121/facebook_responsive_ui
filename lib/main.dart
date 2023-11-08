import 'package:facebook_responsive_ui/config/plate.dart';
import 'package:facebook_responsive_ui/screens/export.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facebook UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Palette.scaffold,
        useMaterial3: true,
      ),
      home: const NavScreen(),
    );
  }
}


