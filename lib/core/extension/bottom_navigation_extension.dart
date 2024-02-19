import 'package:chat_app/app/domain/enum.dart';
import 'package:flutter/material.dart';

extension BottomNavX on BottomNav {
  // icon
  Icon get icon {
    switch (this) {
      case BottomNav.home:
        return const Icon(Icons.home);
      case BottomNav.about:
        return const Icon(Icons.pregnant_woman);
      case BottomNav.setting:
        return const Icon(Icons.accessibility_sharp);
      case BottomNav.profile:
        return const Icon(Icons.account_circle_sharp);
    }
  }

  // image
  Widget get image {
    switch (this) {
      case BottomNav.home:
        return Image.asset('assets/images/');
      case BottomNav.about:
        return Image.asset('assets/images/');
      case BottomNav.setting:
        return Image.asset('assets/images/');
      case BottomNav.profile:
        return Image.asset('assets/images/');
    }
  }

  // label
  String get toName {
    switch (this) {
      case BottomNav.home:
        return '홈';
      case BottomNav.about:
        return '카테고리';
      case BottomNav.setting:
        return '채팅';
      case BottomNav.profile:
        return '설정';
    }
  }
}
