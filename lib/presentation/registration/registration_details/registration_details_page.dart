import 'package:class_room_management_hamon/presentation/registration/registration_details/arguments/registration_detail_arguments.dart';
import 'package:class_room_management_hamon/presentation/registration/registration_details/bloc/registration_details_bloc.dart';
import 'package:class_room_management_hamon/presentation/registration/registration_details/bloc/registration_details_events.dart';
import 'package:class_room_management_hamon/presentation/registration/registration_details/bloc/registration_details_states.dart';
import 'package:class_room_management_hamon/presentation/registration/registration_details/widgets/detail_widget.dart';
import 'package:class_room_management_hamon/utils/app_colors.dart';
import 'package:class_room_management_hamon/utils/app_routes.dart';
import 'package:class_room_management_hamon/utils/app_strings.dart';
import 'package:class_room_management_hamon/utils/custom_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationDetailsPage extends StatefulWidget {
  final RegistrationDetailArguments arguments;

  const RegistrationDetailsPage({super.key, required this.arguments});

  @override
  State<RegistrationDetailsPage> createState() =>
      _RegistrationDetailsPageState();
}

class _RegistrationDetailsPageState extends State<RegistrationDetailsPage> {
  final _registrationDetailsBloc = RegistrationDetailsBloc();

  @override
  void initState() {
    _registrationDetailsBloc
        .add(GetDetails(registration: widget.arguments.registration));
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
            BlocConsumer(
                bloc: _registrationDetailsBloc,
                listener: (context, state) {
                  if(state is DeletionInitiated) {
                    loadingDialog();
                  } else if(state is Deleted) {
                    Navigator.of(context).pop();
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => CustomAlertDialog.success(
                          content: "Successfully Deleted",
                          callback: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                AppRoutes.homeScreen, (route) => false);
                          },
                        ));
                  } else if(state is DeletionFailed) {
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
                },
                builder: (context, state) {
                  if (state is DetailsFetched) {
                    return Positioned(
                      top: 50.0,
                      left: 10.0,
                      right: 10.0,
                      child: Column(
                        children: [
                          DetailWidget(
                              heading: AppStrings().studentDetail,
                              name: state.studentDetails.name,
                              mailOrName: state.studentDetails.email,
                              trailingText:
                                  "${AppStrings().age}: ${state.studentDetails.age}"),
                          const SizedBox(height: 20.0,),
                          DetailWidget(
                              heading: AppStrings().subjectDetail,
                              name: state.subjectDetails.name,
                              mailOrName: state.subjectDetails.teacher,
                              trailingText:
                                  "${AppStrings().credit}: ${state.subjectDetails.credits}")
                        ],
                      ),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                }),
            Positioned(
                bottom: 50.0,
                left: 10.0,
                right: 10.0,
                child: CupertinoButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(AppStrings().delete, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),),
                            content: Text(AppStrings().doYouWantToDelete,  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
                            actions: [
                              TextButton(
                                child: Text(AppStrings().no, style: const TextStyle(color: Colors.black)),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text(AppStrings().yes, style: const TextStyle(color: Colors.black)),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  _registrationDetailsBloc.add(DeleteRegistration(id: widget.arguments.registration.id));
                                },
                              ),
                            ],
                          );
                        }
                    );
                  },
                  color: AppColors.clDarkRed,
                  child: Text(
                    AppStrings().deleteRegistration,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    ));
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
