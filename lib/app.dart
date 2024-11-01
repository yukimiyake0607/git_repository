import 'package:flutter/material.dart';
import 'package:git_repository/ui/screens/search_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchScreen(),
      theme: ThemeData(
        textTheme: TextTheme(
          headlineLarge: TextStyle(fontWeight: FontWeight.bold),
        ),
        appBarTheme: AppBarTheme(backgroundColor: Color(0xFFFCFDF6)),
      ),
    );
  }
}
