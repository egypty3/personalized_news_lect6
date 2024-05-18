import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'H I G H L I G H T S',
      home: SplashScreen(),
    );
  }
}


// TextFormField(
// style: TextStyle(
// letterSpacing: 2.0,
// ),
// ),