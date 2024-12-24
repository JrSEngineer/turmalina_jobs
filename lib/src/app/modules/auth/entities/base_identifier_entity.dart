// ignore_for_file: public_member_api_docs, sort_constructors_first

abstract class BaseIdentifierEntity {
  String id;
  String fullName;
  String document;
  String email;

  BaseIdentifierEntity({
    required this.id,
    required this.fullName,
    required this.document,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullName': fullName,
      'document': document,
      'email': email,
    };
  }

  BaseIdentifierEntity fromMap(Map<String, dynamic> map);
}
