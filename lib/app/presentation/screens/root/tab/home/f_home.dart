import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({
    super.key,
  });

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: '홈화면 입니다'.text.make(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
