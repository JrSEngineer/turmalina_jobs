import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/datasource/interfaces/ijob_vacancy_repository.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/inputs/new_chat_input.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/job_vacancy.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/vacancy_chat.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/vacancy_chat_message.dart';
import 'package:turmalina_jobs/src/shared/exceptions/base_exception.dart';

part 'vacancy_chat_store.g.dart';

class VacancyChatStore = _VacancyChatStore with _$VacancyChatStore;

abstract class _VacancyChatStore with Store {
  _VacancyChatStore(this._repository);

  final IJobVacancyRepository _repository;

  final messageController = TextEditingController();

  @observable
  bool _loading = false;

  bool get loading => _loading;

  @observable
  Stream<BaseException>? _vacancyChatException;

  Stream<BaseException>? get vacancyChatException => _vacancyChatException;

  @observable
  Stream<VacancyChat>? _vacancyChat;

  Stream<VacancyChat>? get vacancyChat => _vacancyChat;

  @action
  Future<void> setChatInteraction(JobVacancy jobVacancy, NewChatInput input) async {
    _setLoadingValue(true);

    final (exception, chatStream) = await _repository.setChatInteraction(jobVacancy, input);

    if (exception != null) {
      _setVacancyChatException(exception);

      _setLoadingValue(false);

      return;
    }

    _setChatStreamValue(chatStream);

    _setLoadingValue(false);
  }

  @action
  Future<void> sendMessage(String vacancyId, String chatId, VacancyChatMessage message) async {
    final (exception, chatStream) = await _repository.sendMessage(vacancyId, chatId, message);

    if (exception != null) {
      _setVacancyChatException(exception);
    }

    _setChatStreamValue(chatStream);
  }

  @action
  void _setLoadingValue(bool value) {
    _loading = value;
  }

  @action
  void _setChatStreamValue(Stream<VacancyChat>? value) {
    _vacancyChat = value?.asBroadcastStream();
  }

  @action
  void _setVacancyChatException(Stream<BaseException> value) {
    _vacancyChatException = value;
  }
}
