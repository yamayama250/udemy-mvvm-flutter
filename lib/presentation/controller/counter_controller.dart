import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_mvvm_flutter/presentation/page/home_page/provider.dart';
import 'package:udemy_mvvm_flutter/repository/count_data_repository.dart';

final counterControllerProvider = Provider((ref) => CounterController());

class CounterController {
  late WidgetRef _ref;
  late final _countDataRepository = _ref.read(countDataRepositoryProvider);

  void setRef(WidgetRef ref) {
    _ref = ref;
  }

  get count => _ref.watch(countDataProvider).count.toString();
  get countUp => _ref.watch(countDataProvider).countUp.toString();
  get countDown => _ref.watch(countDataProvider).countDown.toString();

  void onIncrease() {
    _countDataRepository.increase();
    _ref.watch(countDataProvider.notifier).state =
        _countDataRepository.countData;
  }

  void onDecrease() {
    _countDataRepository.decrease();
    _ref.watch(countDataProvider.notifier).state =
        _countDataRepository.countData;
  }

  void onReset() {
    _countDataRepository.reset();
    _ref.watch(countDataProvider.notifier).state =
        _countDataRepository.countData;
  }
}
