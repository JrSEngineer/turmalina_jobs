// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/vacancy_detail.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/vacancy_post_owner.dart';

class JobVacancy {
  final String id;
  final VacancyPostOwner postOwner;
  final VacancyDetail detail;

  JobVacancy({
    required this.id,
    required this.postOwner,
    required this.detail,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'postOwner': postOwner.toMap(),
      'detail': detail.toMap(),
    };
  }

  factory JobVacancy.fromMap(Map<String, dynamic> map) {
    return JobVacancy(
      id: map['postOwner']['id'],
      postOwner: VacancyPostOwner.fromMap(map['postOwner']),
      detail: VacancyDetail.fromMap(map['vacancyDetail']),
    );
  }
}
