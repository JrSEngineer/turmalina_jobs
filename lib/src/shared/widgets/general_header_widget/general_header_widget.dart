// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class GeneralHeaderWidget extends StatelessWidget {
  const GeneralHeaderWidget({
    Key? key,
    this.showBorder,
    this.widgetBorderColor,
    this.widgetBorderRadius,
    this.internalPadding,
    this.icon,
    this.image,
    this.title,
    this.subTitle,
    this.widgets,
  }) : super(key: key);

  final bool? showBorder;
  final Color? widgetBorderColor;
  final double? widgetBorderRadius;
  final double? internalPadding;
  final Widget? icon;
  final Widget? image;
  final Widget? title;
  final Widget? subTitle;
  final List<Widget>? widgets;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: showBorder ?? false //
            ? Border.all(width: 0.5, color: widgetBorderColor ?? Colors.transparent)
            : null,
        borderRadius: BorderRadius.circular(widgetBorderRadius ?? 4),
      ),
      padding: EdgeInsets.all(internalPadding ?? 0),
      child: Row(
        children: [
          if (icon != null) icon!,
          if (image != null) image!,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null) title!,
                if (subTitle != null) subTitle!,
              ],
            ),
          ),
          Row(
            children: widgets ?? [],
          )
        ],
      ),
    );
  }
}
