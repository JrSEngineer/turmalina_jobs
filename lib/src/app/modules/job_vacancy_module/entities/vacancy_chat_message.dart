// ignore_for_file: public_member_api_docs, sort_constructors_first
class VacancyChatMessage {
  String content;
  String senderId;
  String receiverId;
  DateTime sendDate;

  VacancyChatMessage({
    required this.content,
    required this.senderId,
    required this.receiverId,
    required this.sendDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'content': content,
      'senderId': senderId,
      'receiverId': receiverId,
      'sendDate': sendDate.toString(),
    };
  }

  factory VacancyChatMessage.fromMap(Map map) {
    return VacancyChatMessage(
      content: map['content'],
      senderId: map['senderId'],
      receiverId: map['receiverId'],
      sendDate: DateTime.parse(map['sendDate']),
    );
  }
}
