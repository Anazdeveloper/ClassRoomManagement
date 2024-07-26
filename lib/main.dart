import 'package:class_room_management_hamon/presentation/classrooms/arguments/classroom_detail_arguments.dart';
import 'package:class_room_management_hamon/presentation/classrooms/classroom_layout_screen.dart';
import 'package:class_room_management_hamon/presentation/classrooms/classrooms_list_page.dart';
import 'package:class_room_management_hamon/presentation/registration/new_registration/new_registration_page.dart';
import 'package:class_room_management_hamon/presentation/registration/registration_page/registration_page.dart';
import 'package:class_room_management_hamon/presentation/student/arguments/student_detail_arguments.dart';
import 'package:class_room_management_hamon/presentation/student/arguments/students_page_arguments.dart';
import 'package:class_room_management_hamon/presentation/student/student_detail_page.dart';
import 'package:class_room_management_hamon/presentation/student/students_page.dart';
import 'package:class_room_management_hamon/presentation/subjects/arguments/subject_details_arguments.dart';
import 'package:class_room_management_hamon/presentation/subjects/arguments/subject_page_arguments.dart';
import 'package:class_room_management_hamon/presentation/subjects/subject_details_page.dart';
import 'package:class_room_management_hamon/presentation/subjects/subject_page.dart';
import 'package:class_room_management_hamon/utils/app_routes.dart';
import 'package:class_room_management_hamon/presentation/home/home_screen.dart';
import 'package:class_room_management_hamon/utils/app_theme.dart';
import 'package:class_room_management_hamon/utils/custom_route.dart';
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
        AppRoutes.classroomsPage: (context) => const ClassRoomsListPage(),
        AppRoutes.registrationPage: (context) => const RegistrationPage(),
        AppRoutes.newRegistrationPage: (context) => const NewRegistrationPage()
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.studentsPage:
            return CustomRoute<bool>(
                builder: (context) =>
                    StudentsPage(
                        arguments: settings.arguments as StudentsPageArguments),
                settings: settings);
          case AppRoutes.studentDetailsPage:
            return CustomRoute<bool>(
                builder: (context) =>
                    StudentDetailsPage(
                        arguments: settings.arguments as StudentDetailArguments),
                settings: settings);
          case AppRoutes.subjectDetailsPage:
            return CustomRoute<bool>(
                builder: (context) =>
                    SubjectDetailsPage(
                        arguments: settings.arguments as SubjectDetailsArguments),
                settings: settings);
          case AppRoutes.classRoomLayoutScreen:
            return CustomRoute<bool>(
                builder: (context) =>
                    ClassRoomLayoutScreen(
                        arguments: settings.arguments as ClassRoomDetailArguments),
                settings: settings);
          case AppRoutes.subjectsPage:
            return CustomRoute<bool>(
                builder: (context) =>
                    SubjectsPage(
                        arguments: settings.arguments as SubjectPageArguments),
                settings: settings);
        }
        return null;
      },
    );
  }
}
