// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/view/stores/create_job_vacancy_store.dart';
import 'package:turmalina_jobs/src/shared/widgets/app_button.dart';
import 'package:turmalina_jobs/src/shared/widgets/app_container.dart';
import 'package:turmalina_jobs/src/shared/widgets/app_snackbar.dart';
import 'package:turmalina_jobs/src/shared/widgets/general_header_widget/general_header_image_widget.dart';
import 'package:turmalina_jobs/src/shared/widgets/general_header_widget/general_header_text.dart';
import 'package:turmalina_jobs/src/shared/widgets/general_header_widget/general_header_widget.dart';

class CreateJobVacancyPage extends StatefulWidget {
  const CreateJobVacancyPage({super.key});

  @override
  State<CreateJobVacancyPage> createState() => _CreateJobVacancyPageState();
}

class _CreateJobVacancyPageState extends State<CreateJobVacancyPage> {
  late CreateJobVacancyStore store;

  @override
  void initState() {
    super.initState();

    store = Modular.get<CreateJobVacancyStore>();

    final accountId = Modular.args.params['accountId'] as String;

    store.input.postOwner.id = accountId;
  }

  @override
  Widget build(BuildContext context) {
    final componentImageSize = MediaQuery.sizeOf(context).height * 0.08;
    const componentImageRadius = 12.0;
    const componentImageRightMargin = 12.0;
    final buttonVerticalPadding = MediaQuery.sizeOf(context).height * 0.016;

    final pageSpacing = MediaQuery.sizeOf(context).height * 0.056;

    final formSpacing = MediaQuery.sizeOf(context).height * 0.016;

    const image = 'https://images.pexels.com/photos/93820/pexels-photo-93820.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';

    return AppContainer(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
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
                content: 'Nome da Empresa',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            SizedBox(height: pageSpacing),
            Form(
              key: store.createJobVacancyFormKey,
              child: Column(
                children: [
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelStyle: Theme.of(context).textTheme.labelMedium,
                      label: const Text('Nome do Anunciante'),
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      return value == null || value.isEmpty ? 'Por favor, informe o nome do anunciante.' : null;
                    },
                    onChanged: (value) => store.input.postOwner.name = value,
                  ),
                  SizedBox(height: formSpacing),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            labelStyle: Theme.of(context).textTheme.labelMedium,
                            label: const Text('Nome da Vaga'),
                            border: const OutlineInputBorder(),
                          ),
                          validator: (value) {
                            return value == null || value.isEmpty ? 'Por favor, insira o nome da vaga.' : null;
                          },
                          onChanged: (value) => store.input.vacancyDetail.title = value,
                        ),
                      ),
                      SizedBox(width: formSpacing),
                      Expanded(
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            labelStyle: Theme.of(context).textTheme.labelMedium,
                            label: const Text('Setor da Empresa'),
                            border: const OutlineInputBorder(),
                          ),
                          validator: (value) {
                            return value == null || value.isEmpty ? 'Por favor, informe qual o setor da vaga.' : null;
                          },
                          onChanged: (value) => store.input.vacancyDetail.sectionName = value,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: formSpacing),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      labelStyle: Theme.of(context).textTheme.labelMedium,
                      label: const Text('Descrição'),
                      border: const OutlineInputBorder(),
                    ),
                    maxLines: 4,
                    validator: (value) {
                      return value == null || value.isEmpty ? 'Por favor, insira uma descrição da vaga.' : null;
                    },
                    onChanged: (value) => store.input.vacancyDetail.description = value,
                  ),
                  SizedBox(height: formSpacing),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelStyle: Theme.of(context).textTheme.labelMedium,
                      label: const Text('Local para entrevista'),
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      return value == null || value.isEmpty ? 'Por favor, informe qual é o local da entrevista.' : null;
                    },
                    onChanged: (value) => store.input.vacancyDetail.jobAddress = value,
                  ),
                  SizedBox(height: formSpacing),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          readOnly: true,
                          onTap: () async {
                            final date = await showDatePicker(
                              context: context,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );

                            store.input.vacancyDetail.interviewDate = date ?? DateTime.now();
                          },
                          initialValue: store.input.vacancyDetail.getInterviewDate(),
                          decoration: InputDecoration(
                            labelStyle: Theme.of(context).textTheme.labelMedium,
                            label: const Text('Data'),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: formSpacing),
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            labelStyle: Theme.of(context).textTheme.labelMedium,
                            label: const Text('Hora'),
                            border: const OutlineInputBorder(),
                          ),
                          inputFormatters: [
                            MaskTextInputFormatter(mask: '##:##'),
                          ],
                          onChanged: (value) => store.input.vacancyDetail.interviewDateTime = value,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: pageSpacing),
                ],
              ),
            ),
            SizedBox(height: pageSpacing),
            Observer(
              builder: (_) {
                return AppButton(
                  onTap: () async {
                    if (!store.createJobVacancyFormKey.currentState!.validate()) {
                      return;
                    }

                    if (store.invalidDateValue(store.input.vacancyDetail.interviewDateTime)) {
                      appSnackbar(
                        context,
                        message: 'Formato de hora inválido.',
                      );
                      return;
                    }

                    await store.createNewJobVacancy();

                    if (store.createJobVacancyException != null) {
                      appSnackbar(
                        context,
                        message: 'Erro ao criar nova vaga. ${store.createJobVacancyException!.message}',
                      );
                      return;
                    }
                  },
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  verticalPadding: buttonVerticalPadding,
                  child: store.loading //
                      ? CircularProgressIndicator(color: Theme.of(context).colorScheme.onPrimary)
                      : Text(
                          'Criar Nova Vaga',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
