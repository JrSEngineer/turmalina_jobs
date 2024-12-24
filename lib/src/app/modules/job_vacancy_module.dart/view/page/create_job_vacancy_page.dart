import 'package:flutter/material.dart';
import 'package:turmalina_jobs/src/shared/widgets/app_container.dart';

class CreateJobVacancyPage extends StatefulWidget {
  const CreateJobVacancyPage({super.key});

  @override
  State<CreateJobVacancyPage> createState() => _CreateJobVacancyPageState();
}

class _CreateJobVacancyPageState extends State<CreateJobVacancyPage> {
  @override
  Widget build(BuildContext context) {
    return const AppContainer(
      child: Center(child: Text('CREATE JOB VACANCY PAGE')),
    );
  }
}