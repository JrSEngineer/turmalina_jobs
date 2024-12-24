// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:turmalina_jobs/src/app/modules/auth/entities/base_identifier_entity.dart';

class AppUser extends BaseIdentifierEntity {
  AppUser({
    required super.id,
    required super.fullName,
    required super.document,
    required super.email,
  });

  @override
  BaseIdentifierEntity fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'],
      fullName: map['fullName'],
      document: map['document'],
      email: map['email'],
    );
  }
}
