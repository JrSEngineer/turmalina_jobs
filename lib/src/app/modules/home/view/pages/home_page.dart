import 'package:flutter/material.dart';
import 'package:turmalina_jobs/src/app/modules/home/view/widgets/home_menu_widget.dart';
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
  @override
  Widget build(BuildContext context) {
    final componentImageSize = MediaQuery.sizeOf(context).height * 0.04;
    const componentImageRadius = 45.0;
    const componentImageRightMargin = 12.0;

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
              SizedBox(height: pageSpacing),
              const HomeMenuWidget(),
              SizedBox(height: pageSpacing),
              Expanded(
                child: ListView.separated(
                  itemCount: 6,
                  itemBuilder: (_, i) {
                    return Card(
                      elevation: 8,
                      color: Theme.of(context).colorScheme.onPrimary,
                      surfaceTintColor: Theme.of(context).colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            GeneralHeaderWidget(
                              image: const GeneralHeaderImageWIdget(
                                componentImageSize: 72,
                                componentImageRadius: 8,
                                componentImageRightMargin: componentImageRightMargin,
                                imageUrl: image,
                              ),
                              title: Text(
                                'Nome da Empresa ',
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                              subTitle: Text(
                                'Nome do cargo ',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                                    ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            Text(
                                'Descrição da vaga, com informações dadas pelo anunciante, contendo informações úteis como local de trabalho, carga horária, endereço de e-mail e telefone, ou qualquer informação relevante para a vaga.',
                                style: Theme.of(context).textTheme.bodyLarge)
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, i) {
                    return SizedBox(height: pageSpacing * 0.2);
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
