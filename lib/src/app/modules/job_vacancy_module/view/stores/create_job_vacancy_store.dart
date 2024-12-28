import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/datasource/interfaces/ijob_vacancy_repository.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/inputs/new_vacancy_job_input.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/vacancy_detail.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/vacancy_post_owner.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/enums/job_vacancy_status.dart';
import 'package:turmalina_jobs/src/shared/exceptions/base_exception.dart';

part 'create_job_vacancy_store.g.dart';

class CreateJobVacancyStore = _CreateJobVacancyStore with _$CreateJobVacancyStore;

abstract class _CreateJobVacancyStore with Store {
  _CreateJobVacancyStore(this._repository);

  final IJobVacancyRepository _repository;

  final createJobVacancyFormKey = GlobalKey<FormState>();

  @observable
  bool _loading = false;

  bool get loading => _loading;

  @observable
  BaseException? _createJobVacancyException;

  BaseException? get createJobVacancyException => _createJobVacancyException;

  NewVacancyJobInput input = NewVacancyJobInput(
    postOwner: VacancyPostOwner(
      id: '',
      name: '',
      image: '',
    ),
    vacancyDetail: VacancyDetail(
      title: '',
      description: '',
      jobAddress: '',
      postDate: DateTime.now(),
      interviewDate: DateTime.now(),
      interviewDateTime: '',
      sectionName: '',
      vacancyStatus: JobVacancyStatus.available,
    ),
  );

  Future<void> createNewJobVacancy() async {
    _setLoadingValue(true);

    final (exception, _) = await _repository.createNewVacncy(input);

    if (exception != null) {
      _setcreateJobVacancyExceptionValue(exception);

      _setLoadingValue(false);

      return;
    }

    Modular.to.navigate('/home/');

    _setLoadingValue(false);

    return;
  }

  @action
  _setLoadingValue(bool value) {
    _loading = value;
  }

  @action
  _setcreateJobVacancyExceptionValue(BaseException value) {
    _createJobVacancyException = value;
  }

  bool invalidDateValue(String dateValue) {
    final divideValue = dateValue.split(':');

    final hourValue = int.parse(divideValue[0]);

    final minutesValue = int.parse(divideValue[1]);

    return hourValue > 24 || minutesValue > 59;
  }
}