import 'package:chat_app/app/app.dart';
import 'package:chat_app/app/domain/enum.dart';
import 'package:chat_app/app/presentation/screens/root/mixin_root.dart';
import 'package:chat_app/core/extension/bottom_navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../presentation.dart';

class RootScreen extends ConsumerStatefulWidget {
  final Widget child;
  const RootScreen({super.key, required this.child});
  @override
  ConsumerState<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends ConsumerState<RootScreen> with RootMixin {
  int getIndex(BuildContext context) {
    if (GoRouterState.of(context).matchedLocation == '/root/a') {
      return 0;
    } else if (GoRouterState.of(context).matchedLocation == '/root/b') {
      return 1;
    } else if (GoRouterState.of(context).matchedLocation == '/root/c') {
      return 2;
    } else if (GoRouterState.of(context).matchedLocation == '/root/d') {
      return 3;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(rootNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('${GoRouterState.of(context).matchedLocation}'),
      ),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        items: List.generate(
          BottomNav.values.length,
          (index) => BottomNavigationBarItem(
            icon: BottomNav.values[index].icon,
            label: BottomNav.values[index].toName,
          ),
        ),
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: getIndex(context),
        onTap: (index) {
          if (index == 0) {
            context.go('/root/a');
          } else if (index == 1) {
            context.go('/root/b');
          } else if (index == 2) {
            context.go('/root/c');
          } else {
            context.go('/root/d');
          }
        },
      ),
    );
  }
}
