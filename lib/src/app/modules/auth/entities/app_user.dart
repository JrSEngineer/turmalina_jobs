// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:turmalina_jobs/src/app/modules/auth/entities/base/base_identifier_entity.dart';
import 'package:turmalina_jobs/src/app/modules/auth/enums/account_type.dart';

class AppUser extends BaseIdentifierEntity {
  AppUser({
    required super.id,
    required super.fullName,
    required super.document,
    required super.email,
    required super.accountType,
  });

  factory AppUser.fromMap(Map<String, dynamic> map) {
    final accountType = map['accountType'] == 'user' ? AccountType.user : AccountType.company;

    return AppUser(
      id: map['id'],
      fullName: map['fullName'],
      document: map['document'],
      email: map['email'],
      accountType: accountType,
    );
  }
}
