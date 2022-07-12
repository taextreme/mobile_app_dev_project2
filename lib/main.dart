import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_dev_project2/screen/home_screen.dart';

import 'data/user_update_data.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserUpdateData.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
