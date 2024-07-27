import 'package:class_room_management_hamon/utils/app_colors.dart';
import 'package:flutter/material.dart';

class DetailWidget extends StatelessWidget {
  final String heading;
  final String name;
  final String mailOrName;
  final String trailingText;

  const DetailWidget({super.key, required this.heading, required this.name, required this.mailOrName, required this.trailingText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  heading,
                  style: const TextStyle(
                      fontSize: 17.0, fontWeight: FontWeight.w400),
                ),
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 13.0, fontWeight: FontWeight.w400),
                ),
                Text(
                  mailOrName,
                  style: const TextStyle(
                      fontSize: 13.0, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Text(
              trailingText,
              style: const TextStyle(
                  fontSize: 13.0, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
