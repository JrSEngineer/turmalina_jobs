// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({Key? key, required this.child, this.color}) : super(key: key);

  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    final verticalPadding = height * 0.016;
    final horizontalPadding = width * 0.064;

    return SafeArea(
      child: Scaffold(
        backgroundColor: color ?? Theme.of(context).colorScheme.onPrimary,
        body: Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding,
            horizontal: horizontalPadding,
          ),
          child: child,
        ),
      ),
    );
  }
}
