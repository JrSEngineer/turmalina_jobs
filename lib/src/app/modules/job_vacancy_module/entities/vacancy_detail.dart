import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/enums/job_vacancy_status.dart';

class VacancyDetail {
  String title;
  String description;
  String jobAddress;
  DateTime postDate;
  DateTime interviewDate;
  String interviewDateTime;
  String sectionName;
  JobVacancyStatus vacancyStatus;

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

  String getInterviewDate() {
    final interviewDateStringSections = interviewDate.toString().split(' ').first;

    final unorderedInterviewDateSections = interviewDateStringSections.toString().split('-').toList();

    final orderedInterviewDate = '${unorderedInterviewDateSections[2]}-${unorderedInterviewDateSections[1]}-${unorderedInterviewDateSections[0]}';
    
    return orderedInterviewDate;
  }
}
