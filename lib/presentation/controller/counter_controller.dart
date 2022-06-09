import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_mvvm_flutter/model/count_data.dart';
import 'package:udemy_mvvm_flutter/repository/count_data_repository.dart';

final counterControllerProvider =
    StateNotifierProvider<CounterController, CountData>((ref) =>
        CounterController(repository: ref.watch(countDataRepositoryProvider)));

class CounterController extends StateNotifier<CountData> {
  CounterController({required this.repository})
      : super(const CountData(count: 0, countUp: 0, countDown: 0));

  final CountDataRepository repository;

  get count => state.count;
  get countUp => state.countUp;
  get countDown => state.countDown;

  void onIncrease() {
    repository.increase();
    state = repository.countData;
  }

  void onDecrease() {
    repository.decrease();
    state = repository.countData;
  }

  void onReset() {
    repository.reset();
    state = repository.countData;
  }
}
