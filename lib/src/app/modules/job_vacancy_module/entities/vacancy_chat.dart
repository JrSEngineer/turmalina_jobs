// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/vacancy_chat_message.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/vacancy_post_owner.dart';

class VacancyChat {
  final String id;
  final VacancyPostOwner postOwner;
  final String interessedUser;
  final List<VacancyChatMessage> messages;

  VacancyChat({
    required this.id,
    required this.postOwner,
    required this.interessedUser,
    required this.messages,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'postOwner': postOwner,
      'interessedUser': interessedUser,
      'messages': messages.map((message) => message.toMap()).toList(),
    };
  }

  factory VacancyChat.fromMap(Map<String, dynamic> map) {
    final messagesMapsList = map['messages'] as List;

    final messages = messagesMapsList.map((messageMap) => VacancyChatMessage.fromMap(messageMap)).toList();

    return VacancyChat(
      id: map['id'],
      postOwner: map['postOwner'],
      interessedUser: map['interessedUser'],
      messages: messages,
    );
  }
}
