import 'package:doctor/src/presentation/app/view/app_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.indigo,
    statusBarColor: Colors.indigo,
  ));
  await Firebase.initializeApp();
  runApp( MyApp());
}
