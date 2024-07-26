import 'package:class_room_management_hamon/data/models/response/subjects.dart';
import 'package:class_room_management_hamon/presentation/classrooms/arguments/classroom_detail_arguments.dart';
import 'package:class_room_management_hamon/presentation/subjects/arguments/subject_page_arguments.dart';
import 'package:class_room_management_hamon/presentation/subjects/subject_page.dart';
import 'package:class_room_management_hamon/utils/app_colors.dart';
import 'package:class_room_management_hamon/utils/app_icons.dart';
import 'package:class_room_management_hamon/utils/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ClassRoomLayoutScreen extends StatefulWidget {
  final ClassRoomDetailArguments arguments;

  const ClassRoomLayoutScreen({super.key, required this.arguments});

  @override
  State<ClassRoomLayoutScreen> createState() => _ClassRoomLayoutScreenState();
}

class _ClassRoomLayoutScreenState extends State<ClassRoomLayoutScreen> {
  late Subject selectedSubject;
  bool isSubjectSelected = false;

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
                      widget.arguments.classroom.name,
                      style: const TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Positioned(
                    top: 50.0,
                    left: 15.0,
                    right: 15.0,
                    child: subjectTile()
                ),
                widget.arguments.classroom.layout == "conference" ? Positioned(
                    top: 200.0,
                    left: 10.0,
                    right: 10.0,
                    child:  conferenceLayoutWidget()
                ) : Positioned(
                    top: 200.0,
                    left: 15.0,
                    right: 15.0,
                    bottom: 10.0,
                    child: classRoomLayoutWidget()
                )
              ],
            ),
          ),
        )
    );
  }

  Widget conferenceLayoutWidget() {
    final split1SeatCount = widget.arguments.classroom.size ~/ 2;
    final split2SeatCount = widget.arguments.classroom.size - split1SeatCount;
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: List.generate(widget.arguments.classroom.size % 2 == 0 ? split1SeatCount : split1SeatCount + 1, (index) {
            return Column(
              children: [
                Image.asset(AppIcon.seatIcon),
                const SizedBox(height: 10.0,)
              ],
            );
          }),
        ),
        const SizedBox(width: 10.0),
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: (44 * split1SeatCount).toDouble(),
          decoration: const BoxDecoration(
            color: AppColors.clLightGrey
          ),
        ),
        const SizedBox(width: 10.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.arguments.classroom.size % 2 == 0 ? split2SeatCount : split2SeatCount - 1, (index) {
            return Column(
              children: [
                Image.asset(AppIcon.seatIconRight),
                const SizedBox(height: 10.0,)
              ],
            );
          }),
        )
      ],
    );
  }

  Widget classRoomLayoutWidget() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 30.0,
            crossAxisSpacing: 10.0
        ),
        itemBuilder: (context, index) {
          return Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.0,
                color: Colors.black
              )
            ),
            child: Image.asset(AppIcon.seatIcon),
          );
        },
        itemCount: widget.arguments.classroom.size,
    );
  }

  Widget subjectTile() {
    return Container(
      height: 65.0,
      decoration: const BoxDecoration(
          color: AppColors.clLightGrey,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
        child: isSubjectSelected ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  selectedSubject.name,
                  style: const TextStyle(
                      fontSize: 17.0, fontWeight: FontWeight.w400),
                ),
                Text(
                  selectedSubject.teacher,
                  style: const TextStyle(
                      fontSize: 13.0, fontWeight: FontWeight.w400),
                )
              ],
            ),
            CupertinoButton(
              onPressed: () {
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
                                });
                                Fluttertoast.showToast(
                                    msg: AppStrings().subjectUpdated,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    textColor: AppColors.clDarkGreen,
                                    backgroundColor: AppColors.clLightGreen,
                                    toastLength: Toast.LENGTH_LONG
                                );
                              }
                          )
                      );
                    }
                );
              },
              color: AppColors.clLightGreen,
              child: Text(
                AppStrings().change,
                style: const TextStyle(
                    color: AppColors.clDarkGreen
                ),
              ),
            )
          ],
        ) : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings().addSubject,
              style: const TextStyle(
                  fontSize: 17.0, fontWeight: FontWeight.w400),
            ),
            CupertinoButton(
                onPressed: () {
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
                                });
                                Fluttertoast.showToast(
                                    msg: AppStrings().subjectUpdated,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    textColor: AppColors.clDarkGreen,
                                    backgroundColor: AppColors.clLightGreen,
                                    toastLength: Toast.LENGTH_LONG
                                );
                              }
                            )
                        );
                      }
                  );
                },
                color: AppColors.clLightGreen,
                child: Text(
                  AppStrings().add,
                  style: const TextStyle(
                    color: AppColors.clDarkGreen
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
}
