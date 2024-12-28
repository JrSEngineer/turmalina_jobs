// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:turmalina_jobs/src/app/modules/auth/enums/account_type.dart';

abstract class BaseIdentifierEntity {
  String id;
  String fullName;
  String document;
  String email;
  AccountType accountType;

  BaseIdentifierEntity({
    required this.id,
    required this.fullName,
    required this.document,
    required this.email,
    required this.accountType,
  });
}
