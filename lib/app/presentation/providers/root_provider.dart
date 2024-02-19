import 'package:chat_app/app/domain/enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final rootNotifierProvider =
    StateNotifierProvider<RootNotifier, BottomNav>((ref) => RootNotifier());

class RootNotifier extends StateNotifier<BottomNav> {
  RootNotifier() : super(BottomNav.home);

  void onChangeNavIndex(int index) => state = BottomNav.values[index];
}
