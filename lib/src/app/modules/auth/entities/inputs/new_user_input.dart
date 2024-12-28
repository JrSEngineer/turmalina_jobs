// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:turmalina_jobs/src/app/modules/auth/entities/base/base_account_input.dart';

class NewUserInput extends BaseAccountInput {
  NewUserInput({
    required super.fullName,
    required super.document,
    required super.phoneNumber,
    required super.newAccountInput,
    required super.accountType,
  });
}
