import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_mvvm_flutter/data/repository/count_data_repository.dart';
import 'package:udemy_mvvm_flutter/provider.dart';

final viewModelProvider = Provider((ref) => ViewModel());

class ViewModel {
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
