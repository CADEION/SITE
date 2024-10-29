import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'screens/splash.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return  MaterialApp(
            title: 'Site',
            home: Splash(),
          );
        });
  }
}

