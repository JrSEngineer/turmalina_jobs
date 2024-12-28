import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:turmalina_jobs/src/shared/themes/light_theme.dart';

class TurmalinaJobsApp extends StatelessWidget {
  const TurmalinaJobsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: Modular.routerConfig,
    );
  }
}
