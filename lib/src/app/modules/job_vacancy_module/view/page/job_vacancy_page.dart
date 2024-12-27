import 'package:flutter/material.dart';
import 'package:turmalina_jobs/src/shared/widgets/app_container.dart';

class JobVacancyPage extends StatefulWidget {
  const JobVacancyPage({super.key});

  @override
  State<JobVacancyPage> createState() => _JobVacancyPageState();
}

class _JobVacancyPageState extends State<JobVacancyPage> {
  @override
  Widget build(BuildContext context) {
    return const AppContainer(
      child: Center(child: Text('JOB VACANCY PAGE')),
    );
  }
}