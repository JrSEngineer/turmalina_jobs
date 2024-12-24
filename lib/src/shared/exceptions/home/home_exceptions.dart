import 'package:turmalina_jobs/src/shared/exceptions/base_exception.dart';

class GetJobVacanciesException extends BaseException {
  GetJobVacanciesException({required super.message});
}

class GetMessagesException extends BaseException {
  GetMessagesException({required super.message});
}

class SendMessageException extends BaseException {
  SendMessageException({required super.message});
}
