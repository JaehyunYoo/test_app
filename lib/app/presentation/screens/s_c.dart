import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CScreen extends StatelessWidget {
  const CScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('C 스크린'),
        ],
      ),
    );
  }
}
