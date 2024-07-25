import 'package:class_room_management_hamon/presentation/student/students_page.dart';
import 'package:class_room_management_hamon/utils/app_routes.dart';
import 'package:class_room_management_hamon/presentation/home/home_screen.dart';
import 'package:class_room_management_hamon/utils/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
      routes: <String, WidgetBuilder> {
        AppRoutes.homeScreen: (context) => const HomeScreen(),
        AppRoutes.studentsPage: (context) => const StudentsPage()
      },
    );
  }
}
