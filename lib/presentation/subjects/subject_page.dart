import 'package:class_room_management_hamon/presentation/subjects/arguments/subject_details_arguments.dart';
import 'package:class_room_management_hamon/presentation/subjects/arguments/subject_page_arguments.dart';
import 'package:class_room_management_hamon/presentation/subjects/bloc/subjects_bloc.dart';
import 'package:class_room_management_hamon/presentation/subjects/bloc/subjects_events.dart';
import 'package:class_room_management_hamon/presentation/subjects/bloc/subjects_states.dart';
import 'package:class_room_management_hamon/presentation/subjects/widgets/subjects_list_widget.dart';
import 'package:class_room_management_hamon/utils/app_routes.dart';
import 'package:class_room_management_hamon/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectsPage extends StatefulWidget {
  final SubjectPageArguments arguments;

  const SubjectsPage({super.key, required this.arguments});

  @override
  State<SubjectsPage> createState() => _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectsPage> {
  final _subjectsBloc = SubjectsBloc();

  @override
  void initState() {
    _subjectsBloc.add(GetSubjects());
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
                      AppStrings().subjects,
                      style: const TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                BlocBuilder(
                    bloc: _subjectsBloc,
                    builder: (context, state) {
                      if (state is InitialLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state is SubjectsFetched) {
                        final subjects = state.subjects.subjects;
                        return Positioned(
                          top: 50.0,
                          left: 10.0,
                          right: 10.0,
                          bottom: 10.0,
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return SubjectsListWidget(
                                  name: subjects[index].name,
                                  teacher: subjects[index].teacher,
                                  credit: subjects[index].credits,
                                  onTap: () {
                                    widget.arguments.isSelection ? widget.arguments.selectSubject?.call(subjects[index]) : Navigator.of(context).pushNamed(
                                        AppRoutes.subjectDetailsPage,
                                        arguments: SubjectDetailsArguments(
                                            subject: subjects[index]));
                                  },
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(height: 20.0);
                              },
                              itemCount: subjects.length),
                        );
                      }
                      return Container();
                    })
              ],
            ),
          ),
        )
    );
  }
}
