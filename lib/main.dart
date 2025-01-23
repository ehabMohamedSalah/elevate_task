import 'package:elevate_task/presentation/home_page/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return     MaterialApp(
          home: HomeScreen(),
          debugShowCheckedModeBanner: false,


        );
      },
    ) ;
  }
}


