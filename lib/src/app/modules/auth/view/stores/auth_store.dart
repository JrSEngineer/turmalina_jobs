// ignore_for_file: public_member_api_docs, sort_constructors_first, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:turmalina_jobs/src/app/modules/auth/datasource/interfaces/iauth_repository.dart';
import 'package:turmalina_jobs/src/app/modules/auth/entities/app_company.dart';
import 'package:turmalina_jobs/src/app/modules/auth/entities/app_user.dart';
import 'package:turmalina_jobs/src/app/modules/auth/entities/inputs/login_input.dart';
import 'package:turmalina_jobs/src/app/modules/auth/enums/account_type.dart';
import 'package:turmalina_jobs/src/shared/exceptions/base_exception.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  _AuthStore(this._repository);

  final IAuthRepository _repository;

  final loginFormKey = GlobalKey<FormState>();

  @observable
  bool _loading = false;

  bool get loading => _loading;

  @observable
  BaseException? _loginException;

  BaseException? get loginException => _loginException;

  LoginInput loginInput = LoginInput(
    email: '',
    password: '',
  );

  Future<void> login() async {
    _setLoadingValue(true);

    final (exception, account) = await _repository.login(loginInput);

    if (exception != null) {
      _setLoginExceptionValue(exception);

      _setLoadingValue(false);

      return;
    }

    switch (account!.accountType) {
      case AccountType.user:
        Modular.to.navigate('/home/', arguments: account as AppUser);
        break;
      case AccountType.company:
        Modular.to.navigate('/home/', arguments: account as AppCompany);
        break;
      default:
        return;
    }

    _setLoadingValue(false);

    return;
  }

  @action
  _setLoadingValue(bool value) {
    _loading = value;
  }

  @action
  _setLoginExceptionValue(BaseException value) {
    _loginException = value;
  }
}
