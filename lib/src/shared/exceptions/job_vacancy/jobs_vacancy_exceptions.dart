import 'package:turmalina_jobs/src/shared/exceptions/base_exception.dart';

class GetAllJobVacanciesException extends BaseException {
  GetAllJobVacanciesException({required super.message});
}

class GetJobVacancyException extends BaseException {
  GetJobVacancyException({required super.message});
}

class CreateJobVacancyException extends BaseException {
  CreateJobVacancyException({required super.message});
}

class StartChatException extends BaseException {
  StartChatException({required super.message});
}

class InviteCandidateException extends BaseException {
  InviteCandidateException({required super.message});
}
