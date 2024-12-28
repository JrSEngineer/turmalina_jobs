import 'package:mobx/mobx.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/datasource/interfaces/ijob_vacancy_repository.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/job_vacancy.dart';
import 'package:turmalina_jobs/src/shared/exceptions/base_exception.dart';

part 'get_all_job_vacancies_store.g.dart';

class GetAllJobVacanciesStore = _GetAllJobVacanciesStore with _$GetAllJobVacanciesStore;

abstract class _GetAllJobVacanciesStore with Store {
  _GetAllJobVacanciesStore(this._repository);

  final IJobVacancyRepository _repository;

  @observable
  bool _loading = false;

  bool get loading => _loading;

  @observable
  BaseException? _getJobVacanciesException;

  BaseException? get getJobVacanciesException => _getJobVacanciesException;

  @observable
  List<JobVacancy> _jobVacanciesList = <JobVacancy>[];

  List<JobVacancy> get jobVacanciesList => _jobVacanciesList;

  @action
  Future<void> getAllJobVacancies() async {
    _setLoadingValue(true);

    final (exception, jobVacancies) = await _repository.getAllVacancies();

    if (exception != null) {
      _setGetJobVacanciesException(exception);

      _setLoadingValue(false);

      return;
    }

    _setLoadingValue(false);

    _jobVacanciesList = jobVacancies ?? [];
  }

  @action
  void _setLoadingValue(bool value) {
    _loading = value;
  }

  @action
  void _setGetJobVacanciesException(BaseException value) {
    _getJobVacanciesException = value;
  }
}
