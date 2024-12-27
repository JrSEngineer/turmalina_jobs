import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/datasource/interfaces/ijob_vacancy_repository.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/inputs/new_vacancy_job_input.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/job_vacancy.dart';
import 'package:turmalina_jobs/src/shared/exceptions/base_exception.dart';

class FirebaseJobVacancyRepository implements IJobVacancyRepository {
  @override
  Future<(BaseException?, JobVacancy)> createNewVacncy(NewVacancyJobInput newVacancy) {
    // TODO: implement createNewVacncy
    throw UnimplementedError();
  }

  @override
  Future<(BaseException?, List<JobVacancy>?)> getAllVacancies() {
    // TODO: implement getAllVacancies
    throw UnimplementedError();
  }
}
