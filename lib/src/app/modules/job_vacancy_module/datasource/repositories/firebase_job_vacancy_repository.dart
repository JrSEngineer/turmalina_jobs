import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/datasource/interfaces/ijob_vacancy_repository.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/inputs/new_vacancy_job_input.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/job_vacancy.dart';
import 'package:turmalina_jobs/src/shared/backend/app_collections.dart';
import 'package:turmalina_jobs/src/shared/exceptions/base_exception.dart';
import 'package:turmalina_jobs/src/shared/exceptions/job_vacancy/jobs_vacancy_exceptions.dart';

class FirebaseJobVacancyRepository implements IJobVacancyRepository {
  FirebaseJobVacancyRepository(this._firebase);

  final FirebaseFirestore _firebase;

  @override
  Future<(BaseException?, JobVacancy?)> createNewVacancy(NewVacancyJobInput newVacancy) async {
    try {
      final vacanciesCollection = _firebase.collection(AppCollections.VACANCIES);

      final createdVacancyDocumentReference = vacanciesCollection.doc();

      await createdVacancyDocumentReference.set(newVacancy.toMap());

      await createdVacancyDocumentReference.update({'id': createdVacancyDocumentReference.id});

      final createdVacancyDocument = await createdVacancyDocumentReference.get();

      final createdVacancyMap = createdVacancyDocument.data();

      final createdVacancy = JobVacancy.fromMap(createdVacancyMap ?? {});

      return (null, createdVacancy);
    } on FirebaseException catch (firebaseException) {
      return (CreateJobVacancyException(message: 'Erro ao criar nova vaga. ${firebaseException.message}'), null);
    } catch (exception) {
      return (CreateJobVacancyException(message: 'Erro ao criar nova vaga. $exception'), null);
    }
  }

  @override
  Future<(BaseException?, List<JobVacancy>?)> getAllVacancies() async {
    try {
      final vacanciesCollection = _firebase.collection(AppCollections.VACANCIES);

      final collectionReference = await vacanciesCollection.get();

      final jobVacanciesDocumentsList = collectionReference.docs.toList();

      final jobVacanciesList = jobVacanciesDocumentsList.map((document) {
        final documentMap = document.data();

        return JobVacancy.fromMap(documentMap);
      }).toList();

      return (null, jobVacanciesList);
    } on FirebaseException catch (firebaseException) {
      return (GetAllJobVacanciesException(message: 'Erro obter vagas. ${firebaseException.message}'), null);
    } catch (exception) {
      return (GetAllJobVacanciesException(message: 'Erro obter vagas. $exception'), null);
    }
  }
}
