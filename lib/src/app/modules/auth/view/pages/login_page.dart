import 'package:flutter/material.dart';
import 'package:turmalina_jobs/src/shared/widgets/app_container.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
     return const AppContainer(
      child: Center(child: Text('LOGIN PAGE')),
    );
  }
}