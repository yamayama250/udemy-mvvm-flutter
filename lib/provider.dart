import 'package:flutter_riverpod/flutter_riverpod.dart';

final titleProvider = Provider<String>((ref) => "udemy_mvvm_flutter");
final countMessageProvider =
    Provider<String>((ref) => "floatingActionButtonを押した回数");

final countProvider = StateProvider<int>((ref) => 0);
