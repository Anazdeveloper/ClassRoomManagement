import 'package:class_room_management_hamon/utils/app_colors.dart';
import 'package:class_room_management_hamon/utils/app_strings.dart';
import 'package:flutter/material.dart';

class RegistrationListWidget extends StatelessWidget {
  final int id;
  final void Function() onTap;
  const RegistrationListWidget({super.key, required this.id, required this.onTap});

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
              Text(
                "${AppStrings().registrationId}: #$id",
                style: const TextStyle(
                    fontSize: 17.0, fontWeight: FontWeight.w400),
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
}
