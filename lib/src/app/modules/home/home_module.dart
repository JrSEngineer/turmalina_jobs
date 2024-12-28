import 'package:flutter_modular/flutter_modular.dart';
import 'package:turmalina_jobs/src/app/modules/home/view/pages/home_page.dart';
import 'package:turmalina_jobs/src/app/modules/home/view/pages/profile_page.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/job_vacancy_module.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        JobVacancyModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const HomePage());
    r.child('/profile', child: (_) => const ProfilePage());
  }
}
