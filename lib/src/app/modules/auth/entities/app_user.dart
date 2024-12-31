// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:turmalina_jobs/src/app/modules/auth/entities/base/base_identifier_entity.dart';
import 'package:turmalina_jobs/src/app/modules/auth/enums/account_type.dart';

class AppUser extends BaseIdentifierEntity {
  AppUser({
    required super.id,
    required super.fullName,
    required super.document,
    required super.email,
    required super.token,
    required super.accountType,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'document': document,
      'authentication': {'email': email},
      'token': token,
      'accountType': accountType.name,
    };
  }

  factory AppUser.fromMap(Map map) {
    final accountType = map['accountType'] == 'user' ? AccountType.user : AccountType.company;

    return AppUser(
      id: map['id'],
      fullName: map['fullName'],
      document: map['document'],
      email: map['authentication']['email'],
      token: map['token'],
      accountType: accountType,
    );
  }
}
