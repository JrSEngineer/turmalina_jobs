import 'package:turmalina_jobs/src/shared/exceptions/base_exception.dart';

class LoginException extends BaseException {
  LoginException({required super.message});
}

class RegisterAccountException extends BaseException {
  RegisterAccountException({required super.message});
}

class RecoveryPasswordException extends BaseException {
  RecoveryPasswordException({required super.message});
}
