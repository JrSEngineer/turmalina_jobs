import 'package:turmalina_jobs/src/app/modules/auth/entities/base/base_account_input.dart';

class NewCompanyInput extends BaseAccountInput {
  NewCompanyInput({
    required super.fullName,
    required super.document,
    required super.phoneNumber,
    required super.newAccountInput,
    required super.accountType,
  });
}
