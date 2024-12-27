import 'package:flutter/material.dart';
import 'package:turmalina_jobs/src/shared/widgets/app_container.dart';
import 'package:turmalina_jobs/src/shared/widgets/general_header_widget/general_header_image_widget.dart';
import 'package:turmalina_jobs/src/shared/widgets/general_header_widget/general_header_text.dart';
import 'package:turmalina_jobs/src/shared/widgets/general_header_widget/general_header_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final componentImageSize = MediaQuery.sizeOf(context).height * 0.04;
    const componentImageRadius = 45.0;
    const componentImageRightMargin = 12.0;
    const internalPadding = 12.0;

    const image = 'https://images.pexels.com/photos/93820/pexels-photo-93820.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
    return AppContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GeneralHeaderWidget(
            internalPadding: internalPadding,
            image: GeneralHeaderImageWIdget(
              componentImageSize: componentImageSize,
              componentImageRightMargin: componentImageRightMargin,
              componentImageRadius: componentImageRadius,
              imageUrl: image,
            ),
            title: GeneralHeaderText(
              content: 'Olá, Usuário',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            subTitle: GeneralHeaderText(
              content: 'Boas Vindas!',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
