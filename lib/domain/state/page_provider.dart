import 'package:hooks_riverpod/hooks_riverpod.dart';

final pageProvider =
    StateNotifierProvider<PageNotifier, int>((ref) => PageNotifier(0));

class PageNotifier extends StateNotifier<int> {
  PageNotifier(super.state);

  pageChange(int value) {
    state = value;
  }
}
