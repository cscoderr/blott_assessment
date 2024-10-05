import 'dart:async';

import 'package:blott_assessment/gen/assets.gen.dart';
import 'package:blott_assessment/presentation/authentication/authentication.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(seconds: 2),
      (_) => Navigator.of(context).pushReplacement(AuthenticationPage.route()),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Assets.images.logo.svg(),
      ),
    );
  }
}
