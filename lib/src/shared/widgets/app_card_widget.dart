// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:turmalina_jobs/src/shared/widgets/general_header_widget/general_header_widget.dart';

class AppCardWidget extends StatelessWidget {
  const AppCardWidget({
    Key? key,
    required this.content,
    this.size,
    this.backgroundColor,
    this.elevation,
    this.padding,
    this.radius,
    this.icon,
    this.title,
  }) : super(key: key);

  final double? size;
  final Color? backgroundColor;
  final double? elevation;
  final double? padding;
  final double? radius;
  final String content;
  final Widget? icon;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor ?? Colors.white,
      elevation: elevation,
      surfaceTintColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 0),
      ),
      child: Container(
        padding: EdgeInsets.all(padding ?? 0.0),
        height: size,
        width: size,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GeneralHeaderWidget(
              icon: icon,
              title: title,
            ),
            Text(
              content,
              style: Theme.of(context).textTheme.displayLarge,
            )
          ],
        ),
      ),
    );
  }
}
