// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:turmalina_jobs/src/app/modules/auth/view/stores/auth_store.dart';
import 'package:turmalina_jobs/src/app/modules/auth/view/widgets/app_divider.dart';
import 'package:turmalina_jobs/src/shared/widgets/app_button.dart';
import 'package:turmalina_jobs/src/shared/widgets/app_container.dart';
import 'package:turmalina_jobs/src/shared/widgets/app_logo.dart';
import 'package:turmalina_jobs/src/shared/widgets/app_snackbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late AuthStore store;

  @override
  void initState() {
    super.initState();

    store = Modular.get<AuthStore>();
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: _child(context, store),
    );
  }
}

Widget _child(BuildContext context, AuthStore store) {
  final formPadding = MediaQuery.sizeOf(context).height * 0.024;
  final buttonVerticalPadding = MediaQuery.sizeOf(context).height * 0.016;
  final pageGapSpacing = MediaQuery.sizeOf(context).height * 0.1;
  final width = MediaQuery.sizeOf(context).width;

  return ListView(
    physics: const NeverScrollableScrollPhysics(),
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AppLogo(
            size: LogoSize.medium,
          ),
          Form(
            key: store.loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Entre com seu e-mail e senha'),
                SizedBox(height: formPadding),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    labelStyle: Theme.of(context).textTheme.labelMedium,
                    label: const Text('E-mail'),
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value) {
                    return value == null || value.isEmpty ? 'Por favor, informe um e-mail válido.' : null;
                  },
                  onChanged: (value) => store.loginInput.email = value,
                ),
                SizedBox(height: formPadding),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    labelStyle: Theme.of(context).textTheme.labelMedium,
                    label: const Text('Senha'),
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value) {
                    return value == null || value.isEmpty ? 'Por favor, informe sua senha.' : null;
                  },
                  onChanged: (value) => store.loginInput.password = value,
                ),
                SizedBox(height: formPadding),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {},
                    child: const Text('Esqueci minha senha'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      SizedBox(height: pageGapSpacing),
      Column(
        children: [
          Observer(
            builder: (_) {
              return AppButton(
                onTap: () async {
                  if (!store.loginFormKey.currentState!.validate()) {
                    return;
                  }

                  await store.login();

                  if (store.loginException != null) {
                    appSnackbar(context, message: 'Erro ao realizar login. ${store.loginException!.message}');

                    return;
                  }
                },
                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                verticalPadding: buttonVerticalPadding,
                child: store.loading //
                    ? CircularProgressIndicator(color: Theme.of(context).colorScheme.onPrimary)
                    : Text(
                        'Entrar',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
              );
            },
          ),
          SizedBox(height: pageGapSpacing * 0.1),
          AppDivider(width: width, text: 'Ou'),
          SizedBox(height: pageGapSpacing * 0.1),
          AppButton(
            onTap: () {},
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            verticalPadding: buttonVerticalPadding,
            borderColor: Theme.of(context).colorScheme.secondary,
            child: Text(
              'Use sua conta Google',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          SizedBox(height: pageGapSpacing),
          Text('Caso ainda não tenha uma conta', style: Theme.of(context).textTheme.titleMedium),
          TextButton(
            onPressed: () {
              Modular.to.pushNamed('./register');
            },
            child: Text(
              'Cadastre-se',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ],
      ),
    ],
  );
}
