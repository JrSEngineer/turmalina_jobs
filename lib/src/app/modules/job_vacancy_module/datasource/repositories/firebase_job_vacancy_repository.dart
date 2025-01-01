import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/datasource/interfaces/ijob_vacancy_repository.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/inputs/new_chat_input.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/inputs/new_vacancy_job_input.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/job_vacancy.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/vacancy_chat.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/vacancy_chat_message.dart';
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

  @override
  Future<(Stream<BaseException>?, Stream<VacancyChat>?)> setChatInteraction(JobVacancy jobVacancy, NewChatInput newChatInput) async {
    try {
      final chatStreamController = StreamController<VacancyChat>();

      final newChatId = newChatInput.interessedUserId + jobVacancy.postOwner.id;

      final vacanciesCollection = _firebase.collection(AppCollections.VACANCIES);

      final jobVacancyDocumentToStartNewChat = vacanciesCollection.doc(jobVacancy.id);

      final chat = VacancyChat(
        id: newChatId,
        postOwner: jobVacancy.postOwner,
        interessedUserId: newChatInput.interessedUserId,
        messages: <VacancyChatMessage>[],
      );

      jobVacancyDocumentToStartNewChat
          .collection(AppCollections.CHATS)
          .doc(newChatId) //
          .snapshots() //
          .asBroadcastStream() //
          .listen(
        (chatDocumentSnapshot) {
          final chatDocumentMap = chatDocumentSnapshot.data() ?? {};

          final createdChat = VacancyChat.fromMap(chatDocumentMap);

          chatStreamController.sink.add(createdChat);
        },
      );

      await jobVacancyDocumentToStartNewChat.collection(AppCollections.CHATS).doc(newChatId).set(chat.toMap());

      return (null, chatStreamController.stream);
    } on FirebaseException catch (firebaseException) {
      final StreamController<BaseException> errorStream = StreamController<BaseException>();

      errorStream.sink.add(StartChatException(message: 'Erro iniciar conversa. ${firebaseException.message}'));

      return (errorStream.stream, null);
    } catch (exception) {
      final StreamController<BaseException> errorStream = StreamController<BaseException>();

      errorStream.sink.add(StartChatException(message: 'Erro iniciar conversa. $exception'));

      return (errorStream.stream, null);
    }
  }

  @override
  Future<(Stream<BaseException>?, Stream<VacancyChat>?)> sendMessage(String vacancyId, String chatId, VacancyChatMessage message) async {
    try {
      final chatStreamController = StreamController<VacancyChat>();

      final vacanciesCollection = _firebase.collection(AppCollections.VACANCIES);

      final jobVacancyDocumentReferenceWithCurrentChat = vacanciesCollection.doc(vacancyId);

      jobVacancyDocumentReferenceWithCurrentChat
          .collection(AppCollections.CHATS)
          .doc(chatId) //
          .snapshots()
          .asBroadcastStream()
          .listen((chatDocument) {
        final chatMap = chatDocument.data() ?? {};

        final chat = VacancyChat.fromMap(chatMap);

        chatStreamController.sink.add(chat);
      });

      final jobVacancyChatDocumentReference = await jobVacancyDocumentReferenceWithCurrentChat.collection(AppCollections.CHATS).doc(chatId).get();

      final chatMessages = jobVacancyChatDocumentReference.data()?['messages'] as List;

      chatMessages.insert(0, message.toMap());

      await jobVacancyDocumentReferenceWithCurrentChat.collection(AppCollections.CHATS).doc(chatId).update({'messages': chatMessages});

      return (null, chatStreamController.stream);
    } on FirebaseException catch (firebaseException) {
      final StreamController<BaseException> errorStream = StreamController<BaseException>();

      errorStream.sink.add(StartChatException(message: 'Erro iniciar conversa. ${firebaseException.message}'));

      return (errorStream.stream, null);
    } catch (exception) {
      final StreamController<BaseException> errorStream = StreamController<BaseException>();

      errorStream.sink.add(StartChatException(message: 'Erro iniciar conversa. $exception'));

      return (errorStream.stream, null);
    }
  }
}
