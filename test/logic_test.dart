import 'package:flutter_test/flutter_test.dart';
import 'package:udemy_mvvm_flutter/logic/logic.dart';

void main() {
  Logic target = Logic();
  setUp(() async {
    target = Logic();
  });

  test("init", () async {
    expect(target.countData.count, 0);
    expect(target.countData.countUp, 0);
    expect(target.countData.countDown, 0);
  });
}
