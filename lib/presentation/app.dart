import 'package:flutter/material.dart';
import 'package:git_repository/presentation/router.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        textTheme: TextTheme(
          headlineLarge: TextStyle(fontWeight: FontWeight.bold),
        ),
        appBarTheme: AppBarTheme(backgroundColor: Color(0xFFFCFDF6)),
      ),
    );
  }
}
