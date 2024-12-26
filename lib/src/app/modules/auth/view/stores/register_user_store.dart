// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:turmalina_jobs/src/app/modules/auth/datasource/interfaces/iauth_repository.dart';
import 'package:turmalina_jobs/src/app/modules/auth/entities/inputs/new_account_input.dart';
import 'package:turmalina_jobs/src/app/modules/auth/entities/inputs/new_user_input.dart';
import 'package:turmalina_jobs/src/shared/exceptions/base_exception.dart';

part 'register_user_store.g.dart';

class RegisterUserStore = _RegisterUserStore with _$RegisterUserStore;

abstract class _RegisterUserStore with Store {
  _RegisterUserStore(this._repository);

  final IAuthRepository _repository;

  final registerUserFormkey = GlobalKey<FormState>();

  @observable
  bool _loading = false;

  bool get loading => _loading;

  NewUserInput newUserInput = NewUserInput(
    fullName: '',
    document: '',
    phoneNumber: '',
    newAccountInput: NewAccountInput(
      email: '',
      password: '',
      confirmationPassword: '',
    ),
  );

  @observable
  BaseException? _createUserException;

  BaseException? get createUserException => _createUserException;

  Future<void> registerUser() async {
    _setLoadingValue(true);

    final (exception, createdUser) = await _repository.createNewAccount(newUserInput);

    if (exception != null) {
      _setCreateUserExceptionValue(exception);

      _setLoadingValue(false);

      return;
    }

    _setLoadingValue(false);

    Modular.to.navigate('./home/', arguments: createdUser);
  }

  @action
  _setLoadingValue(bool value) {
    _loading = value;
  }

  @action
  _setCreateUserExceptionValue(BaseException value) {
    _createUserException = value;
  }
}
