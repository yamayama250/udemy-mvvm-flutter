import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_mvvm_flutter/presentation/controller/counter_controller.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final CounterController counterController =
        ref.read(counterControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("udemy_mvvm_flutter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              ref.watch(counterControllerProvider).count.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: counterController.onIncrease,
                  tooltip: "Increment",
                  child: const Icon(CupertinoIcons.add),
                ),
                FloatingActionButton(
                  onPressed: counterController.onDecrease,
                  tooltip: "Decrement",
                  child: const Icon(CupertinoIcons.minus),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  ref.watch(counterControllerProvider).countUp.toString(),
                ),
                Text(
                  ref.watch(counterControllerProvider).countDown.toString(),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterController.onReset,
        tooltip: 'Increment',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
