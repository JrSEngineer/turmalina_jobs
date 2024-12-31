import 'package:flutter/material.dart';

class AppTagWidget extends StatelessWidget {
  const AppTagWidget({
    super.key,
    this.padding,
    this.tagColor,
    this.borderColor,
    this.radius,
    required this.text,
    this.style,
  });

  final double? padding;
  final Color? tagColor;
  final Color? borderColor;
  final double? radius;
  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: padding ?? 1, horizontal: (padding ?? 1) * 3),
        decoration: BoxDecoration(
          color: tagColor,
          border: Border.all(
            width: 0.5,
            color: borderColor ?? Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(radius ?? 1),
        ),
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }
}
