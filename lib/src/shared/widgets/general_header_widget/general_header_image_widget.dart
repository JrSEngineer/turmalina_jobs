// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class GeneralHeaderImageWIdget extends StatelessWidget {
  const GeneralHeaderImageWIdget({
    Key? key,
    required this.componentImageSize,
    required this.componentImageRightMargin,
    required this.componentImageRadius,
    required this.imageUrl,
  }) : super(key: key);

  final double componentImageSize;
  final double componentImageRightMargin;
  final double componentImageRadius;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: componentImageSize,
      margin: EdgeInsets.only(right: componentImageRightMargin),
      width: componentImageSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(componentImageRadius),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(
            imageUrl,
          ),
        ),
      ),
    );
  }
}
