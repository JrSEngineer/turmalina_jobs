import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:turmalina_jobs/src/app/modules/auth/entities/base/base_identifier_entity.dart';
import 'package:turmalina_jobs/src/app/modules/home/view/widgets/home_menu_widget.dart';
import 'package:turmalina_jobs/src/app/modules/home/view/widgets/job_vacancy_card.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/view/stores/get_all_job_vacancies_store.dart';
import 'package:turmalina_jobs/src/shared/widgets/app_container.dart';
import 'package:turmalina_jobs/src/shared/widgets/background_widget.dart';
import 'package:turmalina_jobs/src/shared/widgets/general_header_widget/general_header_image_widget.dart';
import 'package:turmalina_jobs/src/shared/widgets/general_header_widget/general_header_text.dart';
import 'package:turmalina_jobs/src/shared/widgets/general_header_widget/general_header_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late BaseIdentifierEntity _account;

  late GetAllJobVacanciesStore jobVacanciesStore;

  @override
  void initState() {
    super.initState();

    _account = Modular.args.data;

    jobVacanciesStore = Modular.get<GetAllJobVacanciesStore>();

    jobVacanciesStore.getAllJobVacancies();
  }

  @override
  Widget build(BuildContext context) {
    final componentImageSize = MediaQuery.sizeOf(context).height * 0.04;

    final componentImageRadius = MediaQuery.sizeOf(context).height * 0.042;

    const componentImageRightMargin = 12.0;

    final componentCardImageSize = MediaQuery.sizeOf(context).height * 0.056;

    const componentCardImageRadius = 8.0;

    final pageSpacing = MediaQuery.sizeOf(context).height * 0.056;

    const image = 'https://images.pexels.com/photos/93820/pexels-photo-93820.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        const BackgroundWidget(),
        AppContainer(
          color: Colors.transparent,
          child: Column(
            children: [
              GeneralHeaderWidget(
                image: GeneralHeaderImageWIdget(
                  onTap: () {
                    Modular.to.pushNamed('./profile', arguments: _account);
                  },
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
                widgets: [
                  IconButton(
                    onPressed: () {
                      Modular.to.pushNamed('/job_vacancy/create_job_vacancy/${_account.id}');
                    },
                    icon: const Icon(
                      Icons.add_circle_outline,
                    ),
                  )
                ],
              ),
              SizedBox(height: pageSpacing),
              const HomeMenuWidget(),
              SizedBox(height: pageSpacing),
              Expanded(
                child: Observer(
                  builder: (_) {
                    return jobVacanciesStore.loading //
                        ? SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.3,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : RefreshIndicator(
                            onRefresh: () => jobVacanciesStore.getAllJobVacancies(),
                            child: ListView.separated(
                              itemCount: jobVacanciesStore.jobVacanciesList.length,
                              itemBuilder: (_, i) {
                                final jobVacancy = jobVacanciesStore.jobVacanciesList[i];

                                return JobVacancyCard(
                                  jobVacancy: jobVacancy,
                                  onTap: () {
                                    Modular.to.pushNamed('/job_vacancy/${_account.id}', arguments: jobVacancy);
                                  },
                                  componentImageRightMargin: componentImageRightMargin,
                                  postOwnerImage: image,
                                  cardDivider: 24,
                                  componentImageSize: componentCardImageSize,
                                  componentImageRadius: componentCardImageRadius,
                                  padding: 16,
                                  radius: 12,
                                );
                              },
                              separatorBuilder: (_, i) {
                                return SizedBox(height: pageSpacing * 0.2);
                              },
                            ),
                          );
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
