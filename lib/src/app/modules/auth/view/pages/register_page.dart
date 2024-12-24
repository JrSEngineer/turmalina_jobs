import 'package:flutter/material.dart';
import 'package:turmalina_jobs/src/shared/widgets/app_container.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
     return const AppContainer(
      child: Center(child: Text('REGISTER PAGE')),
    );
  }
}