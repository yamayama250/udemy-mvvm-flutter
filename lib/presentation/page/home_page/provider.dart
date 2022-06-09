import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_mvvm_flutter/model/count_data.dart';

final countDataProvider = StateProvider<CountData>(
  (ref) => const CountData(
    count: 0,
    countUp: 0,
    countDown: 0,
  ),
);
