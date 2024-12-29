import 'package:flutter_modular/flutter_modular.dart';
import 'package:turmalina_jobs/src/app/modules/common/common_module.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/view/pages/chat_page.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/datasource/interfaces/ijob_vacancy_repository.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/datasource/repositories/firebase_job_vacancy_repository.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/view/pages/create_job_vacancy_page.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/view/pages/invite_candidate_page.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/view/pages/job_vacancy_page.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/view/stores/create_job_vacancy_store.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/view/stores/get_all_job_vacancies_store.dart';

class JobVacancyModule extends Module {
  @override
  List<Module> get imports => [
        CommonModule(),
      ];

  @override
  void binds(Injector i) {
    i.addSingleton<IJobVacancyRepository>(FirebaseJobVacancyRepository.new);
    i.addLazySingleton<CreateJobVacancyStore>(CreateJobVacancyStore.new);
    i.addLazySingleton<GetAllJobVacanciesStore>(GetAllJobVacanciesStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const JobVacancyPage());
    r.child('/chat', child: (_) => const ChatPage());
    r.child('/create_job_vacancy/:accountId', child: (_) => const CreateJobVacancyPage());
    r.child('/invite_candidate', child: (_) => const InviteCandidatePage());
  }
}
