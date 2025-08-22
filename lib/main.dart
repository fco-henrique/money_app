import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:money_app/firebase_options.dart';
import 'package:money_app/locator.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  setupDependencies();
  runApp(const App());
}