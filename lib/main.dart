import 'package:flutter/material.dart';
import 'package:money_app/locator.dart';

import 'app.dart';

void main() {
  setupDependencies();
  runApp(const App());
}