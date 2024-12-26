// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:turmalina_jobs/src/app/modules/auth/view/stores/register_user_store.dart';
import 'package:turmalina_jobs/src/shared/widgets/app_button.dart';
import 'package:turmalina_jobs/src/shared/widgets/app_snackbar.dart';

class RegisterUserView extends StatefulWidget {
  const RegisterUserView({super.key});

  @override
  State<RegisterUserView> createState() => _RegisterUserViewState();
}

class _RegisterUserViewState extends State<RegisterUserView> {
  late RegisterUserStore store;

  @override
  void initState() {
    super.initState();

    store = Modular.get<RegisterUserStore>();
  }

  @override
  Widget build(BuildContext context) {
    final formSpacing = MediaQuery.sizeOf(context).height * 0.016;
    final buttonVerticalPadding = MediaQuery.sizeOf(context).height * 0.016;

    return Form(
      key: store.registerUserFormkey,
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              labelStyle: Theme.of(context).textTheme.labelMedium,
              label: const Text('Nome Completo'),
              border: const OutlineInputBorder(),
            ),
            validator: (value) {
              return value == null || value.isEmpty ? 'Por favor, informe seu nome completo.' : null;
            },
            onChanged: (value) => store.newUserInput.fullName = value,
          ),
          SizedBox(height: formSpacing),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            inputFormatters: [
              MaskTextInputFormatter(
                mask: '###.###.###-##',
                type: MaskAutoCompletionType.lazy,
              ),
            ],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelStyle: Theme.of(context).textTheme.labelMedium,
              label: const Text('CPF'),
              border: const OutlineInputBorder(),
            ),
            validator: (value) {
              return value == null || value.isEmpty ? 'Por favor, informe um cpf válido.' : null;
            },
            onChanged: (value) => store.newUserInput.document = value,
          ),
          SizedBox(height: formSpacing),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.phone,
            inputFormatters: [
              MaskTextInputFormatter(
                mask: '+55 (##)# ####-####',
                type: MaskAutoCompletionType.lazy,
              ),
            ],
            decoration: InputDecoration(
              labelStyle: Theme.of(context).textTheme.labelMedium,
              label: const Text('Celular'),
              border: const OutlineInputBorder(),
            ),
            validator: (value) {
              return value == null || value.isEmpty ? 'Por favor, informe seu número de celular.' : null;
            },
            onChanged: (value) => store.newUserInput.phoneNumber = value,
          ),
          SizedBox(height: formSpacing),
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
            onChanged: (value) => store.newUserInput.newAccountInput.email = value,
          ),
          SizedBox(height: formSpacing),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              labelStyle: Theme.of(context).textTheme.labelMedium,
              label: const Text('Senha'),
              border: const OutlineInputBorder(),
            ),
            validator: (value) {
              return value == null || value.isEmpty ? 'Por favor, informe uma senha.' : null;
            },
            onChanged: (value) => store.newUserInput.newAccountInput.password = value,
          ),
          SizedBox(height: formSpacing),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              labelStyle: Theme.of(context).textTheme.labelMedium,
              label: const Text('Confirmar Senha'),
              border: const OutlineInputBorder(),
            ),
            validator: (value) {
              return value == null || value.isEmpty ? 'Por favor, informe uma senha de confirmação (igual à anterior).' : null;
            },
            onChanged: (value) => store.newUserInput.newAccountInput.confirmationPassword = value,
          ),
          const Spacer(),
          Observer(
            builder: (_) {
              return AppButton(
                onTap: () async {
                  if (!store.registerUserFormkey.currentState!.validate()) {
                    return;
                  }

                  bool validPasswords = store.newUserInput.newAccountInput.password == store.newUserInput.newAccountInput.confirmationPassword;

                  if (!validPasswords) {
                    appSnackbar(
                      context,
                      message: 'As senhas informadas não correspondem. Por favor, forneça o mesmo valor nos campos de senha.',
                    );
                    return;
                  }

                  await store.registerUser();

                  if (store.createUserException != null) {
                    appSnackbar(
                      context,
                      message: 'Erro ao criar usuário. ${store.createUserException!.message}',
                    );
                    return;
                  }
                },
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                verticalPadding: buttonVerticalPadding,
                child: store.loading //
                    ? CircularProgressIndicator(color: Theme.of(context).colorScheme.onPrimary)
                    : Text(
                        'Finalizar',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
              );
            },
          ),
          SizedBox(height: formSpacing * 4),
        ],
      ),
    );
  }
}
