// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class GeneralHeaderText extends StatelessWidget {
  const GeneralHeaderText({
    Key? key,
    required this.content,
    this.style,
  }) : super(key: key);

  final String content;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: style,
    );
  }
}
