import 'package:flutter/material.dart';
import 'package:turmalina_jobs/src/shared/widgets/app_card_widget.dart';

class HomeMenuWidget extends StatelessWidget {
  const HomeMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final menuHeight = MediaQuery.sizeOf(context).height * 0.172;

    final cardPadding = MediaQuery.sizeOf(context).height * 0.012;

    const cardRadius = 12.0;

    const cardIconSize = 36.0;

    final cardSize = MediaQuery.sizeOf(context).height * 0.172;

    return SizedBox(
      height: menuHeight,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          AppCardWidget(
            padding: cardPadding,
            radius: cardRadius,
            icon: const Icon(
              Icons.computer_rounded,
              size: cardIconSize,
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Aplicações para vagas',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            content: '2',
            size: cardSize,
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            elevation: 12,
          ),
          AppCardWidget(
            padding: cardPadding,
            radius: cardRadius,
            icon: const Icon(
              Icons.message_outlined,
              size: cardIconSize,
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Mensagens',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            content: '8',
            size: cardSize,
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            elevation: 12,
          ),
          AppCardWidget(
            padding: cardPadding,
            radius: cardRadius,
            icon: const Icon(
              Icons.folder_copy_outlined,
              size: cardIconSize,
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Vagas de Interesse',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            content: '2',
            size: cardSize,
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            elevation: 12,
          ),
        ],
      ),
    );
  }
}
