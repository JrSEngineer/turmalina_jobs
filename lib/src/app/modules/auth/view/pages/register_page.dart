import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:turmalina_jobs/src/app/modules/auth/view/pages/register_company_view.dart';
import 'package:turmalina_jobs/src/app/modules/auth/view/pages/register_user_view.dart';
import 'package:turmalina_jobs/src/app/modules/auth/view/stores/register_user_store.dart';
import 'package:turmalina_jobs/src/shared/widgets/app_container.dart';
import 'package:turmalina_jobs/src/shared/widgets/app_switch.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

bool switchValue = false;

class _RegisterPageState extends State<RegisterPage> {
  late RegisterUserStore registerUserStore;

  @override
  void initState() {
    super.initState();

    registerUserStore = Modular.get<RegisterUserStore>();
  }

  ValueNotifier<bool> createCompanyViewSelected = ValueNotifier(false);
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final pageSpacing = MediaQuery.sizeOf(context).height * 0.032;

    return AppContainer(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: pageSpacing),
            Text(
              'Criar Conta',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(height: pageSpacing),
            AppSwitch(
              onTap: () {
                switch (pageController.page) {
                  case 0:
                    pageController.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.ease,
                    );
                    createCompanyViewSelected.value = true;
                    break;
                  case 1:
                    pageController.animateToPage(
                      0,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.ease,
                    );
                    createCompanyViewSelected.value = false;
                    break;
                  default:
                }
              },
              text: 'Modo de criação empresarial',
              animationDuration: 300,
              height: 50,
              width: 100,
              selectedMode: createCompanyViewSelected,
              thumbColor: Theme.of(context).colorScheme.primaryContainer,
              selectedThumbColor: Theme.of(context).colorScheme.primary,
              trackColor: Theme.of(context).colorScheme.onPrimaryContainer,
              selectedTrackColor: Theme.of(context).colorScheme.tertiary,
            ),
            SizedBox(height: pageSpacing),
            Text(
              'Por favor, informe os dados a seguir:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: pageSpacing),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.7,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                scrollDirection: Axis.horizontal,
                children: const [
                  RegisterUserView(),
                  RegisterCompanyView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
