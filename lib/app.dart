import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapplication/presentation/Screens/login_screen.dart';
import 'package:todoapplication/presentation/Screens/todo_screen.dart';

class todoApp extends StatelessWidget {
  const todoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const todoScreen(),
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}
