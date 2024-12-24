import 'package:flutter_modular/flutter_modular.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module.dart/view/page/create_job_vacancy_page.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module.dart/view/page/invite_candidate_page.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module.dart/view/page/job_vacancy_page.dart';

class JobVacancyModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const JobVacancyPage());
    r.child('/create_job_vacancy', child: (_) => const CreateJobVacancyPage());
    r.child('/invite_candidate', child: (_) => const InviteCandidatePage());
  }
}
