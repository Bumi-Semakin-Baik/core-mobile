import 'package:bumibaik_app/screens/auth/login.dart';
import 'package:bumibaik_app/splashscreen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BumiBaik',
      home: Splashscreen(),
    );
  }
}
