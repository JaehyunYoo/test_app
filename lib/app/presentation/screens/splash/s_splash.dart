import 'dart:async';
import 'package:after_layout/after_layout.dart';
import 'package:chat_app/core/extension/duration_extension.dart';
import 'package:chat_app/core/routes/vo_route_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with AfterLayoutMixin {
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    Future.delayed(250.ms, () {
      FlutterNativeSplash.remove();
    });
    Future.delayed(1000.ms, () => context.go('/root/a'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo/splash_logo.png',
            height: 250,
          ),
          'Good Job!!'
              .text
              .bold
              .size(24)
              .align(TextAlign.center)
              .make()
              .pOnly(top: 16),
        ],
      ),
    );
  }
}
