import 'package:chat_app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('라우터!'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              context.go('/root/b');
            },
            child: Text('/root/b'),
          ),
        ],
      ),
    );
  }
}
