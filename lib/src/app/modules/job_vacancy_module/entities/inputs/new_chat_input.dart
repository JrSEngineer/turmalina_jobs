// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/vacancy_chat_message.dart';

class NewChatInput {
  final String interessedUserId;
  final List<VacancyChatMessage> messages;

  NewChatInput({
    required this.interessedUserId,
    required this.messages,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'interessedUserId': interessedUserId,
      'messages': messages.map((message) => message.toMap()).toList(),
    };
  }

  factory NewChatInput.fromMap(Map<String, dynamic> map) {
    final messagesMapsList = map['messages'] as List;

    final messagesList = messagesMapsList.map((messageMap) => VacancyChatMessage.fromMap(messageMap)).toList();

    return NewChatInput(
      interessedUserId: map['interessedUserId'] as String,
      messages: messagesList,
    );
  }
}
