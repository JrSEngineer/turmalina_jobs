// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key, required this.logoSize}) : super(key: key);

  final double logoSize;

  @override
  Widget build(BuildContext context) {
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
