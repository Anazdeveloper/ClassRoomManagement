import 'package:class_room_management_hamon/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final Color? buttonColor;
  final Color? textColor;
  final double? radius;
  final VoidCallback callback;
  final double? width;
  final double? height;
  final double? textSize;
  final EdgeInsets? padding;
  final ShapeBorder shape;
  final double? elevation;
  final String label;
  final Widget? child;

  const CustomButton.stadium(
      {Key? key,
        this.buttonColor,
        required this.callback,
        this.textColor,
        this.width,
        required this.label,
        this.height,
        this.textSize=12,
        this.padding,
        this.elevation,
        this.radius, this.child})
      : shape = const StadiumBorder(),
        super(key: key);

  CustomButton.outlined(
      {Key? key,
        this.buttonColor = Colors.white,
        required this.callback,
        this.width,
        this.textColor,
        required this.label,
        this.height,
        this.textSize=12,
        this.padding,
        this.elevation,
        this.radius, this.child})
      : shape = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: textColor ?? Colors.black)),
        super(key: key);

  CustomButton.flattened(
      {Key? key,
        this.buttonColor,
        required this.callback,
        this.textColor,
        this.width,
        required this.label,
        this.height,
        this.textSize=12,
        this.padding,
        this.elevation,
        this.radius, this.child})
      : shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius ?? 0.0)),
        super(key: key);

  const CustomButton.custom(
      {Key? key,
        this.buttonColor,
        required this.callback,
        this.textColor,
        this.width,
        required this.shape,
        required this.label,
        this.height,
        this.textSize,
        this.padding,
        this.elevation,
        this.radius, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: callback,
      height: height,
      minWidth: width,
      padding: padding,
      color: buttonColor ?? AppColors.clDarkRed,
      shape: shape,
      elevation: elevation,
      child: child??Text(
        label,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.poppins(
            fontSize: textSize, color: textColor ?? Colors.black),
      ),
    );
  }
}
