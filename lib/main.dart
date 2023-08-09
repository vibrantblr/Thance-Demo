import 'package:ThanceDemo/authflow.dart';
import 'package:ThanceDemo/repo/authentication_repo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final userRepository = UserRepository();

  /// only potrait up mode
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(AuthflowApp(userRepository: userRepository)));
}
