import 'package:flutter/material.dart';
import 'package:solid_test/screens/solid_test.dart';
import 'package:solid_test/services/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.init();

  runApp(const SolidTest());
}
