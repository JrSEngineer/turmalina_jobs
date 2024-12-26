// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppSwitch extends StatefulWidget {
  const AppSwitch({
    Key? key,
    this.height,
    this.animationDuration,
    this.trackColor,
    this.thumbColor,
    this.selectedTrackColor,
    this.selectedThumbColor,
    required this.width,
    required this.selectedMode,
    required this.onTap,
    required this.text,
  }) : super(key: key);
  final ValueNotifier<bool> selectedMode;
  final double? height;
  final int? animationDuration;
  final double width;
  final Color? trackColor;
  final Color? thumbColor;
  final Color? selectedTrackColor;
  final Color? selectedThumbColor;
  final Function() onTap;
  final String text;

  @override
  State<AppSwitch> createState() => _AppSwitchState();
}

class _AppSwitchState extends State<AppSwitch> {
  @override
  Widget build(BuildContext context) {
    final horizontalGap = widget.width * 0.12;
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: widget.selectedMode,
        builder: (_, __) {
          return Row(
            children: [
              SizedBox(
                height: widget.height ?? 48,
                width: widget.width,
                child: Stack(
                  children: [
                    AnimatedContainer(
                      duration: Duration(
                        milliseconds: widget.animationDuration ?? 500,
                      ),
                      decoration: BoxDecoration(
                        color: widget.selectedMode.value //
                            ? widget.selectedTrackColor
                            : widget.trackColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    AnimatedAlign(
                      alignment: widget.selectedMode.value //
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      duration: Duration(
                        milliseconds: widget.animationDuration ?? 500,
                      ),
                      child: AnimatedContainer(
                        duration: Duration(
                          milliseconds: widget.animationDuration ?? 500,
                        ),
                        width: widget.width * 0.5,
                        decoration: BoxDecoration(
                          color: widget.selectedMode.value //
                              ? widget.selectedThumbColor
                              : widget.thumbColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: horizontalGap,
              ),
              Text(
                widget.text,
                style: Theme.of(context).textTheme.titleMedium,
              )
            ],
          );
        },
      ),
    );
  }
}
