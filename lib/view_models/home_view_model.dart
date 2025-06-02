import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../counter.dart';

final homeViewModelProvider = Provider((ref) => HomeViewModel(ref));

class HomeViewModel {
  // ignore: deprecated_member_use
  final ProviderRef _ref;

  HomeViewModel(this._ref);

  // UIで使用する値を取得
  int get counter => _ref.watch(counterProvider);

  // タイトル
  String get title => 'Learning Riverpod';
}
