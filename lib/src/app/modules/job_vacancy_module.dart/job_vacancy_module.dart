import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class JobVacancyModule extends Module {
   @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const Scaffold());
  }
}