import 'package:turmalina_jobs/src/app/modules/auth/entities/base/base_account_input.dart';
import 'package:turmalina_jobs/src/app/modules/auth/entities/base/base_identifier_entity.dart';
import 'package:turmalina_jobs/src/app/modules/auth/entities/inputs/login_input.dart';
import 'package:turmalina_jobs/src/app/modules/auth/entities/inputs/recovery_password_input.dart';
import 'package:turmalina_jobs/src/shared/exceptions/base_exception.dart';

abstract class IAuthRepository {
  Future<(BaseException?, BaseIdentifierEntity?)> createNewAccount(BaseAccountInput input);
  Future<(BaseException?, BaseIdentifierEntity?)> login(LoginInput input);
  Future<BaseException?> recoverPassword(RecoveryPasswordInput input);
  Future<void> signOut();
}
