import 'dart:math';

import 'package:class_room_management_hamon/utils/app_colors.dart';
import 'package:class_room_management_hamon/utils/custom_button.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatefulWidget {
  final String? content;
  final String? title;
  final VoidCallback? callback;
  final Color? color;
  final String image;
  final IconData? iconData;

  const CustomAlertDialog.success(
      {Key? key, this.callback, this.content, this.title = "Success"})
      : color = AppColors.clDarkGreen,
        iconData = Icons.check,
        image = "assets/icons/terms.png",
        super(key: key);

  const CustomAlertDialog.warning(
      {Key? key, this.callback, this.content, this.title = "Error"})
      : color = Colors.red,
        iconData = Icons.close,
        image = "assets/icons/drawer/terms.png",
        super(
        key: key,
      );

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animation = Tween<double>(begin: pi, end: 0).animate(_animationController);
    _animationController.forward();
    _animationController.addStatusListener((status) {
      if (_animationController.isCompleted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DecoratedBox(
              decoration: BoxDecoration(
                  color: widget.color,
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1,
                      offset: Offset(1, 1),
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: _animationController.isCompleted
                      ? const Icon(
                    Icons.error,
                    color: Colors.white,
                  )
                      : AnimatedBuilder(
                    builder: (context, _) {
                      return Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(_animation.value),
                        child: Icon(
                          widget.iconData,
                          color: Colors.white,
                          size: 24.0,
                        ),
                      );
                    },
                    animation: _animationController,
                  ),
                ),
              )),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            widget.title ?? "",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: widget.color,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            widget.content ?? "",
            maxLines: 4,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: widget.color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        CustomButton.flattened(
          radius: 10.0,
          callback: () {
            Navigator.of(context).pop();
            widget.callback?.call();
          },
          label: "OK",
          width: 200,
          textColor: Colors.white,
          elevation: 2.0,
          buttonColor: widget.color,
        )
      ],
    );
  }
}
