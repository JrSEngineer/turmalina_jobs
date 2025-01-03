// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:turmalina_jobs/src/app/modules/auth/datasource/interfaces/iauth_repository.dart';
import 'package:turmalina_jobs/src/app/modules/auth/entities/inputs/new_account_input.dart';
import 'package:turmalina_jobs/src/app/modules/auth/entities/inputs/new_company_input.dart';
import 'package:turmalina_jobs/src/app/modules/auth/enums/account_type.dart';
import 'package:turmalina_jobs/src/shared/exceptions/base_exception.dart';

part 'register_company_store.g.dart';

class RegisterCompanyStore = _RegisterCompanyStore with _$RegisterCompanyStore;

abstract class _RegisterCompanyStore with Store {
  _RegisterCompanyStore(this._repository);

  final IAuthRepository _repository;

  final registerCompanyFormkey = GlobalKey<FormState>();

  @observable
  bool _loading = false;

  bool get loading => _loading;

  NewCompanyInput newCompanyInput = NewCompanyInput(
      fullName: '',
      document: '',
      phoneNumber: '',
      newAccountInput: NewAccountInput(
        email: '',
        password: '',
        confirmationPassword: '',
      ),
      accountType: AccountType.company);

  @observable
  BaseException? _createCompanyException;

  BaseException? get createCompanyException => _createCompanyException;

  Future<void> registerCompany() async {
    _setLoadingValue(true);

    final (exception, createdCompany) = await _repository.createNewAccount(newCompanyInput);

    if (exception != null) {
      _setCreateCompanyExceptionValue(exception);

      _setLoadingValue(false);

      return;
    }

    _setLoadingValue(false);

    Modular.to.navigate('./home/', arguments: createdCompany);
  }

  @action
  _setLoadingValue(bool value) {
    _loading = value;
  }

  @action
  _setCreateCompanyExceptionValue(BaseException value) {
    _createCompanyException = value;
  }
}
