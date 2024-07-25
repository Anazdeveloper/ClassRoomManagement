import 'package:class_room_management_hamon/utils/app_colors.dart';
import 'package:class_room_management_hamon/utils/app_strings.dart';
import 'package:flutter/material.dart';

class StudentListWidget extends StatelessWidget {
  final String name;
  final String emailId;
  final int age;

  const StudentListWidget(
      {super.key,
      required this.name,
      required this.emailId,
      required this.age});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 17.0, fontWeight: FontWeight.w400),
                ),
                Text(
                  emailId,
                  style: const TextStyle(
                      fontSize: 13.0, fontWeight: FontWeight.w400),
                )
              ],
            ),
            Text(
              "${AppStrings().age}: $age",
              style: const TextStyle(fontSize: 17.0, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
