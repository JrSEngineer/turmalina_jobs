// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:turmalina_jobs/src/app/modules/auth/datasource/interfaces/iauth_repository.dart';
import 'package:turmalina_jobs/src/app/modules/auth/entities/app_user.dart';
import 'package:turmalina_jobs/src/app/modules/auth/entities/base/base_account_input.dart';
import 'package:turmalina_jobs/src/app/modules/auth/entities/base/base_identifier_entity.dart';
import 'package:turmalina_jobs/src/app/modules/auth/entities/inputs/login_input.dart';
import 'package:turmalina_jobs/src/app/modules/auth/entities/inputs/recovery_password_input.dart';
import 'package:turmalina_jobs/src/app/modules/auth/enums/account_type.dart';
import 'package:turmalina_jobs/src/shared/backend/app_collections.dart';
import 'package:turmalina_jobs/src/shared/exceptions/auth/auth_exceptions.dart';
import 'package:turmalina_jobs/src/shared/exceptions/base_exception.dart';

class FirebaseAuthRepository implements IAuthRepository {
  FirebaseAuthRepository(this._auth, this._firebase);

  final FirebaseAuth _auth;

  final FirebaseFirestore _firebase;

  @override
  Future<(BaseException?, BaseIdentifierEntity?)> createNewAccount(BaseAccountInput input) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: input.newAccountInput.email,
        password: input.newAccountInput.password,
      );

      String collectionName = _setUserCollection(input.accountType);

      final usersCollection = _firebase.collection(collectionName);

      final newUserMap = input.toMap();

      newUserMap['id'] = credential.user?.uid;

      final newUserDocument = usersCollection.doc(newUserMap['id'])..set(newUserMap);

      final documentSnapshot = await newUserDocument.get();

      final createdUserMap = documentSnapshot.data();

      createdUserMap?.putIfAbsent('email', () => input.newAccountInput.email);

      final user = AppUser.fromMap(createdUserMap ?? {});

      return (null, user);
    } on FirebaseAuthException catch (firebaseException) {
      return (RegisterAccountException(message: firebaseException.message!), null);
    } catch (exception) {
      return (RegisterAccountException(message: 'Um erro inesperado ocorreu: $exception'), null);
    }
  }

  @override
  Future<(BaseException?, BaseIdentifierEntity?)> login(LoginInput input) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<BaseException?> recoverPassword(RecoveryPasswordInput input) {
    // TODO: implement recoverPassword
    throw UnimplementedError();
  }

  String _setUserCollection(AccountType accountType) {
    switch (accountType) {
      case AccountType.user:
        return AppCollections.USERS;
      case AccountType.company:
        return AppCollections.COMPANIES;
      default:
        return AppCollections.USERS;
    }
  }
}
