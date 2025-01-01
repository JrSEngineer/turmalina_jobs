import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/inputs/new_chat_input.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/inputs/new_vacancy_job_input.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/job_vacancy.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/vacancy_chat.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/vacancy_chat_message.dart';
import 'package:turmalina_jobs/src/shared/exceptions/base_exception.dart';

abstract class IJobVacancyRepository {
  Future<(BaseException?, List<JobVacancy>?)> getAllVacancies();
  Future<(BaseException?, JobVacancy?)> createNewVacancy(NewVacancyJobInput newVacancy);
  Future<(Stream<BaseException>?, Stream<VacancyChat>?)> setChatInteraction(JobVacancy jobVacancy, NewChatInput newChatInput);
  Future<(Stream<BaseException>?, Stream<VacancyChat>?)> sendMessage(String vacancyId, String chatId, VacancyChatMessage message);
}
