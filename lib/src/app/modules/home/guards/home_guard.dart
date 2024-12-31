import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:turmalina_jobs/src/app/modules/auth/entities/base/base_identifier_entity.dart';
import 'package:turmalina_jobs/src/shared/services/interfaces/iapp_local_storage_service.dart';

class HomeGuard extends RouteGuard {
  HomeGuard() : super(redirectTo: '/login');

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    try {
      final authLocalStorage = Modular.get<IAppLocalStorageService<BaseIdentifierEntity, String>>();

      final (_, accountId) = await authLocalStorage.retrieveMetaData('id');

      final (_, storedAccount) = await authLocalStorage.retrieve(accountId!);

      Modular.setArguments(storedAccount);

      return (storedAccount != null);
    } catch (e) {
      return false;
    }
  }
}
