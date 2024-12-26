// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:turmalina_jobs/src/app/modules/auth/view/stores/register_company_store.dart';
import 'package:turmalina_jobs/src/shared/widgets/app_button.dart';
import 'package:turmalina_jobs/src/shared/widgets/app_snackbar.dart';

class RegisterCompanyView extends StatefulWidget {
  const RegisterCompanyView({super.key});

  @override
  State<RegisterCompanyView> createState() => _RegisterCompanyViewState();
}

class _RegisterCompanyViewState extends State<RegisterCompanyView> {
  late RegisterCompanyStore store;

  @override
  void initState() {
    super.initState();

    store = Modular.get<RegisterCompanyStore>();
  }

  @override
  Widget build(BuildContext context) {
    final formSpacing = MediaQuery.sizeOf(context).height * 0.016;
    final buttonVerticalPadding = MediaQuery.sizeOf(context).height * 0.016;

    return Form(
      key: store.registerCompanyFormkey,
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              labelStyle: Theme.of(context).textTheme.labelMedium,
              label: const Text('Nome da Empresa'),
              border: const OutlineInputBorder(),
            ),
            validator: (value) {
              return value == null || value.isEmpty ? 'Por favor, informe seu nome completo.' : null;
            },
            onChanged: (value) => store.newCompanyInput.fullName = value,
          ),
          SizedBox(height: formSpacing),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            inputFormatters: [
              MaskTextInputFormatter(
                mask: '##.###.###/####-##',
                type: MaskAutoCompletionType.lazy,
              ),
            ],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelStyle: Theme.of(context).textTheme.labelMedium,
              label: const Text('CNPJ'),
              border: const OutlineInputBorder(),
            ),
            validator: (value) {
              return value == null || value.isEmpty ? 'Por favor, informe um cpf válido.' : null;
            },
            onChanged: (value) => store.newCompanyInput.document = value,
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
            onChanged: (value) => store.newCompanyInput.phoneNumber = value,
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
            onChanged: (value) => store.newCompanyInput.newAccountInput.email = value,
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
            onChanged: (value) => store.newCompanyInput.newAccountInput.password = value,
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
            onChanged: (value) => store.newCompanyInput.newAccountInput.confirmationPassword = value,
          ),
          const Spacer(),
          Observer(
            builder: (_) {
              return AppButton(
                onTap: () async {
                  if (!store.registerCompanyFormkey.currentState!.validate()) {
                    return;
                  }

                  bool validPasswords = store.newCompanyInput.newAccountInput.password == store.newCompanyInput.newAccountInput.confirmationPassword;

                  if (!validPasswords) {
                    appSnackbar(
                      context,
                      message: 'As senhas informadas não correspondem. Por favor, forneça o mesmo valor nos campos de senha.',
                    );
                    return;
                  }

                  await store.registerCompany();

                  if (store.createCompanyException != null) {
                    appSnackbar(
                      context,
                      message: 'Erro ao criar usuário. ${store.createCompanyException!.message}',
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
