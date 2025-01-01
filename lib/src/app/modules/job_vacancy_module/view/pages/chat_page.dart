import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/inputs/new_chat_input.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/job_vacancy.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/vacancy_chat.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/vacancy_chat_message.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/view/stores/vacancy_chat_store.dart';
import 'package:turmalina_jobs/src/shared/widgets/app_container.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late VacancyChatStore _store;

  late JobVacancy _jobVacancy;

  late String _interessedUserId;
  @override
  void initState() {
    _interessedUserId = Modular.args.params['interessedUserId'];

    _store = Modular.get<VacancyChatStore>();

    _jobVacancy = Modular.args.data;

    final input = NewChatInput(interessedUserId: _interessedUserId, messages: <VacancyChatMessage>[]);

    _store.setChatInteraction(_jobVacancy, input);

    super.initState();
  }

  @override
  void dispose() {
    _store.vacancyChat?.drain();

    _store.vacancyChatException?.drain();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Usuário',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          StreamBuilder<VacancyChat>(
            stream: _store.vacancyChat,
            builder: (context, snapshot) {
              final chat = snapshot.data;

              return !snapshot.hasData
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        ListView(
                          reverse: true,
                          shrinkWrap: true,
                          children: snapshot.data?.messages
                                  .map(
                                    (message) => SizedBox(
                                      child: Text(message.content),
                                    ),
                                  )
                                  .toList() ??
                              [
                                Center(
                                  child: Text(
                                    'Nenhuma mensagem',
                                    style: Theme.of(context).textTheme.headlineMedium,
                                  ),
                                )
                              ],
                        ),
                        TextFormField(
                          controller: _store.messageController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed: () {
                                final message = VacancyChatMessage(
                                  content: _store.messageController.text,
                                  senderId: _interessedUserId,
                                  receiverId: _jobVacancy.postOwner.id,
                                  sendDate: DateTime.now(),
                                );

                                if (_store.messageController.text.isNotEmpty) {
                                  _store.sendMessage(_jobVacancy.id, chat?.id ?? '', message);

                                  _store.messageController.clear();
                                }
                              },
                              icon: const Icon(Icons.send),
                            ),
                          ),
                        )
                      ],
                    );
            },
          ),
        ],
      ),
    );
  }
}
