import 'package:class_room_management_hamon/presentation/student/arguments/student_detail_arguments.dart';
import 'package:class_room_management_hamon/utils/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentDetailsPage extends StatefulWidget {
  final StudentDetailArguments arguments;

  const StudentDetailsPage({super.key, required this.arguments});

  @override
  State<StudentDetailsPage> createState() => _StudentDetailsPageState();
}

class _StudentDetailsPageState extends State<StudentDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings().studentDetail,
                      style: const TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.3,
                  left: 20.0,
                  right: 20.0,
                  child: Column(
                    children: [
                      Text(widget.arguments.student.name, style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w400),),
                      Text("${AppStrings().age} : ${widget.arguments.student.age}", style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w400),),
                      Text(widget.arguments.student.email, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
