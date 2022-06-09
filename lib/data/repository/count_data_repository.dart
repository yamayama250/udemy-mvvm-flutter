import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_mvvm_flutter/data/count_data.dart';

final countDataRepositoryProvider =
    Provider((ref) => CountDataRepositoryImpl());

abstract class CountDataRepository {
  get countData;
  void increase();
  void decrease();
  void reset();
}

class CountDataRepositoryImpl implements CountDataRepository {
  CountData _countData = const CountData(count: 0, countUp: 0, countDown: 0);

  @override
  get countData => _countData;

  @override
  void increase() {
    _countData = _countData.copyWith(
      count: _countData.count + 1,
      countUp: _countData.countUp + 1,
    );
  }

  @override
  void decrease() {
    _countData = _countData.copyWith(
      count: _countData.count - 1,
      countDown: _countData.countDown + 1,
    );
  }

  @override
  void reset() {
    _countData = const CountData(count: 0, countUp: 0, countDown: 0);
  }
}
