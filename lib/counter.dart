import 'package:hooks_riverpod/hooks_riverpod.dart';

// カウンターの状態を管理するプロバイダー
final counterProvider = StateProvider<int>((ref) => 0);
