// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  AppButton({
    Key? key,
    required this.onTap,
    this.radius = 4,
    this.verticalPadding = 4,
    this.child,
    this.style,
    this.backgroundColor,
    this.borderColor,
  }) : super(key: key);

  void Function() onTap;
  double radius;
  double verticalPadding;
  Widget? child;
  TextStyle? style;
  Color? backgroundColor;
  Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            width: 0.5,
            color: borderColor ?? Colors.transparent,
          ),
        ),
        child: Center(child: child),
      ),
    );
  }
}
