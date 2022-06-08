import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_mvvm_flutter/data/count_data.dart';

final titleProvider = Provider<String>((ref) => "udemy_mvvm_flutter");
final countMessageProvider =
    Provider<String>((ref) => "floatingActionButtonを押した回数");

final countDataProvider = StateProvider<CountData>(
  (ref) => const CountData(
    count: 0,
    countUp: 0,
    countDown: 0,
  ),
);
