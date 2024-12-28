// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  AppLogo({Key? key, required this.size}) : super(key: key);

  LogoSize size;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    double logoSize = 0.0;

    switch (size) {
      case LogoSize.small:
        logoSize = height * 0.16;
      case LogoSize.medium:
        logoSize = height * 0.2;
      case LogoSize.large:
        logoSize = height * 0.24;
        break;
      default:
        logoSize = height * 0.16;
    }

    return Center(
      child: SizedBox(
        height: logoSize,
        width: logoSize,
        child: Image.asset(
          'assets/images/turmalina_jobs_logo.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

enum LogoSize {
  small,
  medium,
  large;
}
