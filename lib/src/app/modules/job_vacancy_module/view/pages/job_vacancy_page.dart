import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:turmalina_jobs/src/app/modules/home/view/widgets/job_vacancy_card.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/job_vacancy.dart';
import 'package:turmalina_jobs/src/shared/widgets/app_container.dart';
import 'package:turmalina_jobs/src/shared/widgets/background_widget.dart';
import 'package:turmalina_jobs/src/shared/widgets/general_header_widget/general_header_image_widget.dart';
import 'package:turmalina_jobs/src/shared/widgets/general_header_widget/general_header_text.dart';
import 'package:turmalina_jobs/src/shared/widgets/general_header_widget/general_header_widget.dart';

class JobVacancyPage extends StatefulWidget {
  const JobVacancyPage({super.key});

  @override
  State<JobVacancyPage> createState() => _JobVacancyPageState();
}

class _JobVacancyPageState extends State<JobVacancyPage> {
  late JobVacancy _jobVacancy;

  late String _interessedUserId = '';

  @override
  void initState() {
    super.initState();

    _jobVacancy = Modular.args.data;

    _interessedUserId = Modular.args.params['interessedUserId'];
  }

  @override
  Widget build(BuildContext context) {
    const componentImageRadius = 12.0;

    const componentImageRightMargin = 12.0;

    final componentCardImageSize = MediaQuery.sizeOf(context).height * 0.072;

    final pageSpacing = MediaQuery.sizeOf(context).height * 0.056;

    const image = 'https://images.pexels.com/photos/93820/pexels-photo-93820.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
    return Stack(
      children: [
        const BackgroundWidget(),
        AppContainer(
          color: Colors.transparent,
          child: Column(
            children: [
              GeneralHeaderWidget(
                image: GeneralHeaderImageWIdget(
                  componentImageSize: componentCardImageSize,
                  componentImageRightMargin: componentImageRightMargin,
                  componentImageRadius: componentImageRadius,
                  imageUrl: image,
                ),
                title: GeneralHeaderText(
                  content: _jobVacancy.postOwner.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                subTitle: GeneralHeaderText(
                  content: _jobVacancy.detail.sectionName,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              SizedBox(height: pageSpacing),
              JobVacancyCard(
                padding: 16,
                radius: 12,
                jobVacancy: _jobVacancy,
                onTap: null,
                titleStyle: Theme.of(context).textTheme.headlineMedium,
                subTitleStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                postOwnerImage: image,
                extendedMode: true,
                widgets: [
                  Text(
                    _jobVacancy.detail.jobAddress,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.12),
                  InkWell(
                    onTap: () {
                      Modular.to.pushNamed('./chat/$_interessedUserId', arguments: _jobVacancy);
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.message_outlined),
                        SizedBox(width: 12),
                        Text('Enviar Mensagem'),
                      ],
                    ),
                  ),
                  SizedBox(height: pageSpacing * 0.5),
                  InkWell(
                    onTap: () {},
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.send_outlined),
                        SizedBox(width: 12),
                        Text('Enviar Currículo'),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
