import 'package:flutter/material.dart';
import 'package:turmalina_jobs/src/shared/widgets/app_container.dart';

class InviteCandidatePage extends StatefulWidget {
  const InviteCandidatePage({super.key});

  @override
  State<InviteCandidatePage> createState() => _InviteCandidatePageState();
}

class _InviteCandidatePageState extends State<InviteCandidatePage> {
  @override
  Widget build(BuildContext context) {
    return const AppContainer(
      child: Center(child: Text('INVITE CANDIDATE PAGE')),
    );
  }
}
