import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TurmalinaJobsApp extends StatelessWidget {
  const TurmalinaJobsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: Modular.routerConfig,
    );
  }
}
