import 'package:class_room_management_hamon/presentation/home/widgets/selection_column_widget.dart';
import 'package:class_room_management_hamon/presentation/home/widgets/selection_widget.dart';
import 'package:class_room_management_hamon/utils/app_colors.dart';
import 'package:class_room_management_hamon/utils/app_icons.dart';
import 'package:class_room_management_hamon/utils/app_routes.dart';
import 'package:class_room_management_hamon/utils/app_strings.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isGrid = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings().hello,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
            ),
            Text(
              AppStrings().goodMorning,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
            )
          ],
        ),
        actions: [
          isGrid
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isGrid = !isGrid;
                      });
                    },
                    child: Image.asset(AppIcon.gridIcon),
                  ),
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isGrid = !isGrid;
                    });
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ))
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
          child: isGrid ? columnLayout() : gridLayout(),
        ),
      ),
    ));
  }

  Widget gridLayout() {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 30.0,
          crossAxisSpacing: 10.0),
      children: [
        SelectionWidget(
          icon: AppIcon.studentsIcon,
          name: AppStrings().students,
          color: AppColors.clLightGreen,
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.studentsPage);
          },
        ),
        SelectionWidget(
          icon: AppIcon.subjectsIcon,
          name: AppStrings().subjects,
          color: AppColors.clLightBlue,
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.subjectsPage);
          },
        ),
        SelectionWidget(
          icon: AppIcon.classRoomIcon,
          name: AppStrings().classRooms,
          color: AppColors.clLightRed,
          onTap: () {},
        ),
        SelectionWidget(
          icon: AppIcon.registrationIcon,
          name: AppStrings().registration,
          color: AppColors.clLightYellow,
          onTap: () {},
        )
      ],
    );
  }

  Widget columnLayout() {
    return Column(
      children: [
        SelectionColumnWidget(
          name: AppStrings().students,
          color: AppColors.clLightGreen,
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.studentsPage);
          },
        ),
        const SizedBox(height: 20.0),
        SelectionColumnWidget(
          name: AppStrings().subjects,
          color: AppColors.clLightBlue,
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.subjectsPage);
          },
        ),
        const SizedBox(height: 20.0),
        SelectionColumnWidget(
          name: AppStrings().classRooms,
          color: AppColors.clLightRed,
          onTap: () {

          },
        ),
        const SizedBox(height: 20.0),
        SelectionColumnWidget(
          name: AppStrings().registration,
          color: AppColors.clLightYellow,
          onTap: () {

          },
        ),
      ],
    );
  }
}
