import 'package:class_room_management_hamon/data/models/response/student.dart';
import 'package:class_room_management_hamon/data/models/response/subjects.dart';
import 'package:class_room_management_hamon/presentation/registration/new_registration/bloc/new_registration_bloc.dart';
import 'package:class_room_management_hamon/presentation/registration/new_registration/bloc/new_registration_events.dart';
import 'package:class_room_management_hamon/presentation/registration/new_registration/bloc/new_registration_states.dart';
import 'package:class_room_management_hamon/presentation/student/arguments/students_page_arguments.dart';
import 'package:class_room_management_hamon/presentation/student/students_page.dart';
import 'package:class_room_management_hamon/presentation/subjects/arguments/subject_page_arguments.dart';
import 'package:class_room_management_hamon/presentation/subjects/subject_page.dart';
import 'package:class_room_management_hamon/utils/app_colors.dart';
import 'package:class_room_management_hamon/utils/app_routes.dart';
import 'package:class_room_management_hamon/utils/app_strings.dart';
import 'package:class_room_management_hamon/utils/custom_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NewRegistrationPage extends StatefulWidget {
  const NewRegistrationPage({super.key});

  @override
  State<NewRegistrationPage> createState() => _NewRegistrationPageState();
}

class _NewRegistrationPageState extends State<NewRegistrationPage> {
  late Subject selectedSubject;
  bool isSubjectSelected = false;
  late Student selectedStudent;
  bool isStudentSelected = false;
  int subjectId = 0;
  int studentId = 0;

  final _newRegistrationBloc = NewRegistrationBloc();

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
                  AppStrings().newRegistration,
                  style: const TextStyle(
                      fontSize: 22.0, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Positioned(
                top: 50.0,
                left: 10.0,
                right: 10.0,
                child: BlocListener(
                  bloc: _newRegistrationBloc,
                  listener: (context, state) {
                    if(state is RegistrationSuccessful) {
                      Navigator.of(context).pop();
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => CustomAlertDialog.success(
                            content: "Successfully Registered",
                            callback: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  AppRoutes.homeScreen, (route) => false);
                            },
                          ));
                    }

                    if(state is RegistrationFailure) {
                      Navigator.of(context).pop();
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => CustomAlertDialog.warning(
                            content: state.error.message,
                            callback: () {
                              Navigator.of(context).pop();
                            },
                          ));
                    }

                    if(state is InitialLoading) {
                      loadingDialog();
                    }
                  },
                  child: Column(
                    children: [
                     isSubjectSelected ? newRegistrationWidget(
                         onTap: () {
                           showDialog(
                               context: context,
                               builder: (context) {
                                 return SubjectsPage(
                                     arguments: SubjectPageArguments(
                                         isSelection: true,
                                         selectSubject: (subject) {
                                           Navigator.of(context).pop();
                                           setState(() {
                                             selectedSubject = subject;
                                             isSubjectSelected = true;
                                             subjectId = subject.id;
                                           });
                                         }
                                     )
                                 );
                               });
                         },
                         text: selectedSubject.name)  : newRegistrationWidget(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return SubjectsPage(
                                      arguments: SubjectPageArguments(
                                          isSelection: true,
                                          selectSubject: (subject) {
                                            Navigator.of(context).pop();
                                            setState(() {
                                              selectedSubject = subject;
                                              isSubjectSelected = true;
                                              subjectId = subject.id;
                                            });
                                          }
                                      )
                                  );
                                });
                          },
                          text: AppStrings().selectSubject),
                      const SizedBox(
                        height: 30.0,
                      ),
                      isStudentSelected ? newRegistrationWidget(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return StudentsPage(
                                      arguments: StudentsPageArguments(
                                          isSelection: true,
                                          selectStudent: (student) {
                                            Navigator.of(context).pop();
                                            setState(() {
                                              selectedStudent = student;
                                              isStudentSelected = true;
                                              studentId = student.id;
                                            });
                                          }
                                      )
                                  );
                                }
                            );
                          },
                          text: selectedStudent.name
                      ) : newRegistrationWidget(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return StudentsPage(
                                      arguments: StudentsPageArguments(
                                        isSelection: true,
                                        selectStudent: (student) {
                                          Navigator.of(context).pop();
                                          setState(() {
                                            selectedStudent = student;
                                            isStudentSelected = true;
                                            studentId = student.id;
                                          });
                                        }
                                      )
                                  );
                                }
                            );
                          },
                          text: AppStrings().selectStudent
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      CupertinoButton(
                          color: AppColors.clDarkGreen,
                          onPressed: () {
                            if(subjectId != 0 && studentId != 0) {
                              _newRegistrationBloc.add(Register(subjectId: subjectId, studentId: studentId));
                            } else {
                              Fluttertoast.showToast(
                                  msg: AppStrings().registerAlert,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  textColor: AppColors.clDarkRed,
                                  backgroundColor: AppColors.clLightRed,
                                  toastLength: Toast.LENGTH_LONG
                              );
                            }
                          },
                          child: Text(
                            AppStrings().register,
                          ))
                    ],
                  ),
                ))
          ],
        ),
      ),
    ));
  }

  Widget newRegistrationWidget(
      {required void Function() onTap, required String text}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 65.0,
        decoration: const BoxDecoration(
            color: AppColors.clLightGrey,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: const TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              const Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }

  loadingDialog() {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        // dialogContext = context;
        return const Dialog(
          child: SizedBox(
            height: 100.0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
