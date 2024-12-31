import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:turmalina_jobs/firebase_options.dart';
import 'package:turmalina_jobs/src/app/turmalina_jobs_app.dart';
import 'package:turmalina_jobs/src/app/turmalina_jobs_module.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(_initializeApp());
}

Widget _initializeApp() {
  return ModularApp(
    module: TurmalinaJobsModule(),
    child: const TurmalinaJobsApp(),
  );
}
