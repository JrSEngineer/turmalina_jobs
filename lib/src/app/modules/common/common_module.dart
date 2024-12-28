import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CommonModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addInstance(FirebaseAuth.instance);
    i.addInstance(FirebaseFirestore.instance);
  }
}
