import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:we_the_people_admin/app/app.dart';
import 'package:we_the_people_admin/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const WeThePeopleAdminApp());
}
