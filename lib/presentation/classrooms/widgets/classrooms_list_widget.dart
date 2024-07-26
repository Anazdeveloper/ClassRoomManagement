import 'package:class_room_management_hamon/utils/app_colors.dart';
import 'package:class_room_management_hamon/utils/app_strings.dart';
import 'package:flutter/material.dart';

class ClassroomsListWidget extends StatelessWidget {
  final String name;
  final String type;
  final int seats;
  final void Function() onTap;

  const ClassroomsListWidget({super.key, required this.name, required this.type, required this.seats, required this.onTap});

  @override
  Widget build(BuildContext context) {
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 17.0, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    type,
                    style: const TextStyle(
                        fontSize: 13.0, fontWeight: FontWeight.w400),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    "$seats",
                    style: const TextStyle(fontSize: 17.0, fontWeight: FontWeight.w400),
                  ),
                  Expanded(
                    child: Text(
                      AppStrings().seats,
                      style: const TextStyle(fontSize: 17.0, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
