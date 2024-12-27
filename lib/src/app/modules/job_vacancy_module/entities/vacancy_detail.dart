import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/enums/job_vacancy_status.dart';

class VacancyDetail {
  final String title;
  final String description;
  final String jobAddress;
  final DateTime postDate;
  final DateTime interviewDate;
  final String interviewDateTime;
  final String sectionName;
  final JobVacancyStatus vacancyStatus;

  VacancyDetail({
    required this.title,
    required this.description,
    required this.jobAddress,
    required this.postDate,
    required this.interviewDate,
    required this.interviewDateTime,
    required this.sectionName,
    required this.vacancyStatus,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'jobAddress': jobAddress,
      'postDate': postDate.toString(),
      'interviewDate': interviewDate.toString(),
      'sectionName': sectionName,
      'vacancyStatus': vacancyStatus.name,
    };
  }

  factory VacancyDetail.fromMap(Map<String, dynamic> map) {
    final vacancyStatus = map['vacancyStatus'] == 'available' ? JobVacancyStatus.available : JobVacancyStatus.closed;

    return VacancyDetail(
      title: map['title'],
      description: map['description'],
      jobAddress: map['jobAddress'],
      postDate: DateTime.parse(map['postDate']),
      interviewDate: DateTime.parse(map['interviewDate']),
      interviewDateTime: map['interviewDateTime'],
      sectionName: map['sectionName'],
      vacancyStatus: vacancyStatus,
    );
  }
}
