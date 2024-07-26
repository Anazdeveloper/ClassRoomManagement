import 'package:class_room_management_hamon/presentation/registration/registration_page/bloc/registration_page_bloc.dart';
import 'package:class_room_management_hamon/presentation/registration/registration_page/bloc/registration_page_events.dart';
import 'package:class_room_management_hamon/presentation/registration/registration_page/bloc/registration_page_states.dart';
import 'package:class_room_management_hamon/presentation/registration/registration_page/widgets/registration_list_widget.dart';
import 'package:class_room_management_hamon/utils/app_colors.dart';
import 'package:class_room_management_hamon/utils/app_routes.dart';
import 'package:class_room_management_hamon/utils/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _registrationPageBloc = RegistrationPageBloc();

  @override
  void initState() {
    _registrationPageBloc.add(GetRegistrationData());
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
                  AppStrings().registration,
                  style: const TextStyle(
                      fontSize: 22.0, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            BlocBuilder(
                bloc: _registrationPageBloc,
                builder: (context, state) {
                  if (state is InitialLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is RegistrationDataEmpty) {
                    return Center(child: Text(state.message, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400)));
                  }

                  if (state is RegistrationDataFetched) {
                    final registrations = state.registrationData.registrations;

                    return Positioned(
                        top: 50.0,
                        left: 10.0,
                        right: 10.0,
                        bottom: 50.0,
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return RegistrationListWidget(
                                  id: registrations[index].id, onTap: () {});
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(height: 20.0);
                            },
                            itemCount: registrations.length));
                  }
                  return Container();
                }),
            Positioned(
                bottom: 40.0,
                left: 10.0,
                right: 10.0,
                child: CupertinoButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.newRegistrationPage);
                  },
                  color: AppColors.clLightBlue,
                  child: Text(
                      AppStrings().newRegistration,
                      style: const TextStyle(
                        color: AppColors.clDarkBlue,
                        fontWeight: FontWeight.w600,
                        fontSize: 17
                      ),
                  ),
                )
            )
          ],
        ),
      ),
    ));
  }
}
