import 'dart:async';

import 'package:bumibaik_app/screens/auth/login.dart';
import 'package:bumibaik_app/screens/menu/dashboard.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  @override
  void initState() {
    super.initState();

    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  _goNext() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (ctx) => Dashboard(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
