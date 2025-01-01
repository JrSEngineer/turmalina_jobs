import 'package:turmalina_jobs/src/shared/exceptions/base_exception.dart';

abstract class IAppLocalStorageService<T,M> {
  Future<(BaseException?, T?)> save(String key, T data);
  Future<(BaseException?, M?)> saveMetaData(String key, M metadata);
  Future<(BaseException?, M?)> retrieveMetaData(String key);
  Future<(BaseException?, T?)> retrieve(String key);
  Future<void> clearStorage();
}
