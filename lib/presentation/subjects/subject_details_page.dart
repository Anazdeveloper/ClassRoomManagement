import 'package:class_room_management_hamon/presentation/subjects/arguments/subject_details_arguments.dart';
import 'package:class_room_management_hamon/utils/app_strings.dart';
import 'package:flutter/material.dart';

class SubjectDetailsPage extends StatefulWidget {
  final SubjectDetailsArguments arguments;

  const SubjectDetailsPage({super.key, required this.arguments});

  @override
  State<SubjectDetailsPage> createState() => _SubjectDetailsPageState();
}

class _SubjectDetailsPageState extends State<SubjectDetailsPage> {
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
                      AppStrings().subjectDetail,
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
                      Text(widget.arguments.subject.name, style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w400),),
                      Text(widget.arguments.subject.teacher, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                      Text("${AppStrings().credit} : ${widget.arguments.subject.credits}", style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w400),),
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
