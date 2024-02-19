import 'package:flutter/material.dart';

class BScreen extends StatelessWidget {
  const BScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('B 스크린'),
        ],
      ),
    );
  }
}
