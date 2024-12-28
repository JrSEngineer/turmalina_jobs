import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.onPrimary,
      height: MediaQuery.sizeOf(context).height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Spacer(),
          Expanded(
            child: Image.asset(
              'assets/images/app_turmalina_jobs_background.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
            child: Image.asset(
              'assets/images/app_turmalina_jobs_background.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
            child: Image.asset(
              'assets/images/app_turmalina_jobs_background.png',
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
