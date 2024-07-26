import 'package:class_room_management_hamon/presentation/classrooms/bloc/classrooms_bloc.dart';
import 'package:class_room_management_hamon/presentation/classrooms/bloc/classrooms_events.dart';
import 'package:class_room_management_hamon/presentation/classrooms/bloc/classrooms_states.dart';
import 'package:class_room_management_hamon/presentation/classrooms/widgets/classrooms_list_widget.dart';
import 'package:class_room_management_hamon/utils/app_routes.dart';
import 'package:class_room_management_hamon/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassRoomsListPage extends StatefulWidget {
  const ClassRoomsListPage({super.key});

  @override
  State<ClassRoomsListPage> createState() => _ClassRoomsListPageState();
}

class _ClassRoomsListPageState extends State<ClassRoomsListPage> {
  final _classRoomsBloc = ClassRoomBloc();

  @override
  void initState() {
    _classRoomsBloc.add(GetClassrooms());
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
                      AppStrings().classRooms,
                      style: const TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                BlocBuilder(
                    bloc: _classRoomsBloc,
                    builder: (context, state) {
                      if (state is InitialLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state is ClassRoomsFetched) {
                        final classrooms = state.classRoomData.classrooms;
                        return Positioned(
                          top: 50.0,
                          left: 10.0,
                          right: 10.0,
                          bottom: 10.0,
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return ClassroomsListWidget(
                                  name: classrooms[index].name,
                                  type: classrooms[index].layout,
                                  seats: classrooms[index].size,
                                  onTap: () {
                                    // Navigator.of(context).pushNamed(
                                    //     AppRoutes.subjectDetailsPage,
                                    //     arguments: SubjectDetailsArguments(
                                    //         subject: subjects[index]));
                                  },
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(height: 20.0);
                              },
                              itemCount: classrooms.length),
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
