import 'package:flutter/material.dart';
import 'package:turmalina_jobs/src/shared/widgets/app_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const AppContainer(
      child: Center(child: Text('HOME PAGE')),
    );
  }
}
