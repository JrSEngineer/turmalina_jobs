import 'package:flutter/material.dart';
import 'package:turmalina_jobs/src/shared/widgets/app_container.dart';

class RecoveryPage extends StatefulWidget {
  const RecoveryPage({super.key});

  @override
  State<RecoveryPage> createState() => _RecoveryPageState();
}

class _RecoveryPageState extends State<RecoveryPage> {
  @override
  Widget build(BuildContext context) {
    return const AppContainer(
      child: Center(child: Text('RECOVERY PAGE')),
    );
  }
}
