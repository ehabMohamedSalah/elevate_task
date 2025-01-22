import 'package:elevate_task/presentation/home_page/home_screen.dart';
import 'package:flutter/material.dart';

import 'core/api/apiManager.dart';
import 'core/di/di.dart';

void main() {
    ApiManager.init();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomeScreen(),
    );
  }
}


