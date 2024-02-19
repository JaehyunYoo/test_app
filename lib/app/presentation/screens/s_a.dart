import 'package:chat_app/core/utils/logger/custom_logger.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AScreen extends StatefulWidget {
  const AScreen({super.key});

  @override
  State<AScreen> createState() => _AScreenState();
}

class _AScreenState extends State<AScreen> {
  @override
  void initState() {
    Logger.log('testA 스크린빌드');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('A 스크린'),
          ElevatedButton(
            onPressed: () {
              context.go('/test');
            },
            child: Text('/test'),
          ),
        ],
      ),
    );
  }
}
