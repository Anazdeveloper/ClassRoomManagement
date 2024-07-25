import 'package:class_room_management_hamon/presentation/student/bloc/students_bloc.dart';
import 'package:class_room_management_hamon/presentation/student/bloc/students_events.dart';
import 'package:class_room_management_hamon/presentation/student/bloc/students_states.dart';
import 'package:class_room_management_hamon/presentation/student/widgets/student_list_widget.dart';
import 'package:class_room_management_hamon/utils/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({super.key});

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  final _studentBloc = StudentsBloc();

  @override
  void initState() {
    _studentBloc.add(GetStudents());
    super.initState();
  }

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
                  AppStrings().students,
                  style:
                      const TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            BlocBuilder(
                bloc: _studentBloc,
                builder: (context, state) {
                  if(state is InitialLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if(state is StudentsListFetched) {
                    final students = state.students.students;
                    return Positioned(
                      top: 50.0,
                      left: 10.0,
                      right: 10.0,
                      bottom: 10.0,
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return StudentListWidget(name: students[index].name, emailId: students[index].email, age: students[index].age);
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 20.0);
                          },
                          itemCount: students.length
                      ),
                    );
                  }
                  return Container();
                }
            )
          ],
        ),
      ),
    ));
  }
}
