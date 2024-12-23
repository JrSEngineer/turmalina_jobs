import 'package:flutter_modular/flutter_modular.dart';
import 'package:turmalina_jobs/src/app/modules/auth/auth_module.dart';

class TurmalinaJobsModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module('/', module: AuthModule());
  }
}
