// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/candiate_user.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/vacancy_detail.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/vacancy_post_owner.dart';

class JobVacancy {
  final String id;
  final VacancyPostOwner postOwner;
  final VacancyDetail detail;
  final List<CandidateUser> candidates;

  JobVacancy({
    required this.id,
    required this.postOwner,
    required this.detail,
    required this.candidates,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'postOwner': postOwner.toMap(),
      'detail': detail.toMap(),
      'candidates': candidates.map((candidate) => candidate.toMap()).toList(),
    };
  }

  factory JobVacancy.fromMap(Map<String, dynamic> map) {
    final candidatesMapsList = map['candidates'] as List;

    final candidatesList = candidatesMapsList.map((candidateMap) => CandidateUser.fromMap(candidateMap)).toList();
    return JobVacancy(
      id: map['id'],
      postOwner: VacancyPostOwner.fromMap(map['postOwner']),
      detail: VacancyDetail.fromMap(map['vacancyDetail']),
      candidates: candidatesList,
    );
  }
}
