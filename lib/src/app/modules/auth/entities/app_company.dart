import 'package:turmalina_jobs/src/app/modules/auth/entities/base_identifier_entity.dart';

class AppCompany extends BaseIdentifierEntity {
  AppCompany({
    required super.id,
    required super.fullName,
    required super.document,
    required super.email,
  });

  @override
  BaseIdentifierEntity fromMap(Map<String, dynamic> map) {
    return AppCompany(
      id: map['id'],
      fullName: map['fullName'],
      document: map['document'],
      email: map['email'],
    );
  }
}
