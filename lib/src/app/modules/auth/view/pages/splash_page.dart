import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:turmalina_jobs/src/shared/widgets/app_container.dart';
import 'package:turmalina_jobs/src/shared/widgets/app_logo.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Modular.to.navigate('./home/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: _child(),
    );
  }
}

Widget _child() => const AppContainer(
      child: AppLogo(logoSize: 172),
    );
