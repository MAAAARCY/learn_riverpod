import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'counter.dart';

final homeNotifyProvider = Provider<HomeNotifier>((ref) {
  final counter = ref.watch(counterProvider);
  return HomeNotifier(counter);
});

class HomeNotifier {
  final int _counter;

  HomeNotifier(this._counter);

  // UIで使用する値を取得
  int get counter => _counter;

  // タイトル
  String get title => 'Learning Riverpod';
}
