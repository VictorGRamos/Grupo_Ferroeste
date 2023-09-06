import 'package:flutter/material.dart';
import 'package:grupo_ferroeste/screens/login.dart';
import 'themes/main_theme.dart';

void main() {
  runApp(const MainApp());
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grupo Ferroeste',
      theme: mainTheme,
      home: Login(),
    );
  }
}
