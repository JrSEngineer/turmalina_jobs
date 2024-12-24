import 'package:flutter/material.dart';
import 'package:turmalina_jobs/src/shared/widgets/app_container.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const AppContainer(
      child: Center(child: Text('PROFILE PAGE')),
    );
  }
}
