import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_strings.dart';

import '../feature/auth/presentation/screens/splash_screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      // title: 'To-Do App', =>//hard coded
      title :AppStrings.appName,
    debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}
