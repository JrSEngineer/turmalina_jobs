import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:turmalina_jobs/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(_body());
}

Widget _body() {
  String myText = 'HELLO WORLD!';

  return MaterialApp(
    home: Scaffold(
      body: Center(
        child: Text(myText),
      ),
    ),
  );
  
}
