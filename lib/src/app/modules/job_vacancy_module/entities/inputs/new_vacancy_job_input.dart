import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/candiate_user.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/vacancy_detail.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/vacancy_post_owner.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class NewVacancyJobInput {
  final VacancyPostOwner postOwner;
  final VacancyDetail vacancyDetail;
  final List<CandidateUser> candidates;

  NewVacancyJobInput({
    required this.postOwner,
    required this.vacancyDetail,
    required this.candidates,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'postOwner': postOwner.toMap(),
      'vacancyDetail': vacancyDetail.toMap(),
      'candidates': candidates.map((candidate) => candidate.toMap()).toList(),
    };
  }

  factory NewVacancyJobInput.fromMap(Map<String, dynamic> map) {
    return NewVacancyJobInput(
      postOwner: VacancyPostOwner.fromMap(map['postOwner']),
      vacancyDetail: VacancyDetail.fromMap(map['vacancyDetail']),
      candidates: <CandidateUser>[],
    );
  }
}
