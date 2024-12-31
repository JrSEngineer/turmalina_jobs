import 'package:hive/hive.dart';
import 'package:turmalina_jobs/src/app/modules/auth/entities/app_company.dart';
import 'package:turmalina_jobs/src/app/modules/auth/entities/app_user.dart';
import 'package:turmalina_jobs/src/app/modules/auth/entities/base/base_identifier_entity.dart';
import 'package:turmalina_jobs/src/app/modules/auth/enums/account_type.dart';
import 'package:turmalina_jobs/src/shared/exceptions/auth/auth_exceptions.dart';
import 'package:turmalina_jobs/src/shared/exceptions/base_exception.dart';
import 'package:turmalina_jobs/src/shared/services/interfaces/iapp_local_storage_service.dart';

class HiveAuthLocalStorage implements IAppLocalStorageService<BaseIdentifierEntity, String> {
  HiveAuthLocalStorage(this._hive);

  final HiveInterface _hive;

  @override
  Future<(BaseException?, BaseIdentifierEntity?)> save(String key, BaseIdentifierEntity data) async {
    try {
      Box<Map<String, dynamic>> authBox;

      Map<String, dynamic> dataMap = {};

      authBox = await _hive.openBox<Map<String, dynamic>>('auth');

      switch (data.accountType) {
        case AccountType.user:
          AppUser user = data as AppUser;

          dataMap = user.toMap();

          await authBox.put(key, dataMap);
          break;
        case AccountType.company:
          AppCompany user = data as AppCompany;

          dataMap = user.toMap();

          await authBox.put(key, dataMap);
          break;

        default:
      }

      return (null, data);
    } on HiveError catch (error) {
      return (SaveAccountDataException(message: error.message), null);
    } catch (exception) {
      return (SaveAccountDataException(message: 'Erro ao salvar dados da conta localmente: ${exception.toString()}'), null);
    }
  }

  @override
  Future<(BaseException?, BaseIdentifierEntity?)> retrieve(String key) async {
    try {
      Box<Map> authBox;

      BaseIdentifierEntity? data;

      authBox = await _hive.openBox('auth');

      final savedAccountData = authBox.get(key);

      if (savedAccountData == null) {
        return (RetrieveAccountDataException(message: 'Erro ao obter informações locais.'), null);
      }

      switch (savedAccountData['accountType']) {
        case 'user':
          data = AppUser.fromMap(savedAccountData);

          break;
        case 'company':
          data = AppCompany.fromMap(savedAccountData);

          break;

        default:
      }

      return (null, data);
    } on HiveError catch (error) {
      return (RetrieveAccountDataException(message: error.message), null);
    } catch (exception) {
      return (RetrieveAccountDataException(message: 'Erro ao obter informações locais: ${exception.toString()}'), null);
    }
  }

  @override
  Future<(BaseException?, String?)> saveMetaData(String key, String metadata) async {
    try {
      Box<String> metaDataBox;

      metaDataBox = await _hive.openBox<String>('metadata');

      await metaDataBox.put(key, metadata);

      return (null, metadata);
    } on HiveError catch (error) {
      return (SaveAccountDataException(message: error.message), null);
    } catch (exception) {
      return (SaveAccountDataException(message: 'Erro ao salvar dados da conta localmente: ${exception.toString()}'), null);
    }
  }

  @override
  Future<(BaseException?, String?)> retrieveMetaData(String key) async {
    try {
      Box<String> metadataBox;

      metadataBox = await _hive.openBox<String>('metadata');

      final savedAccountData = metadataBox.get(key);

      if (savedAccountData == null) {
        return (RetrieveAccountDataException(message: 'Erro ao obter informações locais.'), null);
      }

      return (null, savedAccountData);
    } on HiveError catch (error) {
      return (RetrieveAccountDataException(message: error.message), null);
    } catch (exception) {
      return (RetrieveAccountDataException(message: 'Erro ao obter informações locais: ${exception.toString()}'), null);
    }
  }
}
