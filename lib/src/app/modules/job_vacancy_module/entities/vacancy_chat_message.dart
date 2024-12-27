// ignore_for_file: public_member_api_docs, sort_constructors_first
class VacancyChatMessage {
  String content;
  String senderId;
  String senreceiverId;
  DateTime sendDate;

  VacancyChatMessage({
    required this.content,
    required this.senderId,
    required this.senreceiverId,
    required this.sendDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'content': content,
      'sendDate': sendDate.toString(),
    };
  }

  factory VacancyChatMessage.fromMap(Map<String, dynamic> map) {
    return VacancyChatMessage(
      content: map['content'],
      senderId: map['senderId'],
      senreceiverId: map['senreceiverId'],
      sendDate: DateTime.parse(map['sendDate']),
    );
  }
}
