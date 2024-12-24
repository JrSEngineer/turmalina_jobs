import 'package:flutter_modular/flutter_modular.dart';
import 'package:turmalina_jobs/src/app/modules/auth/view/pages/login_page.dart';
import 'package:turmalina_jobs/src/app/modules/auth/view/pages/recovery_page.dart';
import 'package:turmalina_jobs/src/app/modules/auth/view/pages/register_page.dart';
import 'package:turmalina_jobs/src/app/modules/auth/view/pages/splash_page.dart';
import 'package:turmalina_jobs/src/app/modules/home/home_module.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module.dart/job_vacancy_module.dart';

class AuthModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const SplashPage());
    r.child('/login', child: (_) => const LoginPage());
    r.child('/register', child: (_) => const RegisterPage());
    r.child('/recovery', child: (_) => const RecoveryPage());
    r.module('home', module: HomeModule());
    r.module('job_vacancy', module: JobVacancyModule());
  }
}
