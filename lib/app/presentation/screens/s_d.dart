import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DScreen extends StatelessWidget {
  const DScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('D 스크린'),
        ],
      ),
    );
  }
}
