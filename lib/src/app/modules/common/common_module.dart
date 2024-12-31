import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:turmalina_jobs/src/app/modules/auth/entities/base/base_identifier_entity.dart';
import 'package:turmalina_jobs/src/app/modules/auth/services/hive_auth_local_storage.dart';
import 'package:turmalina_jobs/src/shared/services/interfaces/iapp_local_storage_service.dart';

class CommonModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addInstance(FirebaseAuth.instance);
    i.addInstance(FirebaseFirestore.instance);
    i.addInstance<HiveInterface>(Hive);
    i.addSingleton<IAppLocalStorageService<BaseIdentifierEntity, String>>(HiveAuthLocalStorage.new);
  }
}
