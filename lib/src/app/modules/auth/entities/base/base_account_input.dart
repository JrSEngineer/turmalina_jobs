// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:turmalina_jobs/src/app/modules/auth/entities/inputs/new_account_input.dart';

abstract class BaseAccountInput {
  String fullName;
  String document;
  String phoneNumber;
  NewAccountInput newAccountInput;

  BaseAccountInput({
    required this.fullName,
    required this.document,
    required this.phoneNumber,
    required this.newAccountInput,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullName': fullName,
      'document': document,
      'phoneNumber': phoneNumber,
      'authentication': newAccountInput.toMap(),
    };
  }
}
