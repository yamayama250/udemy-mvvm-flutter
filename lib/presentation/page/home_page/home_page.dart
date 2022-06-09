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
  late final CounterController _counterController =
      ref.read(counterControllerProvider);

  @override
  void initState() {
    super.initState();

    _counterController.setRef(ref);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("udemy_mvvm_flutter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _counterController.count,
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: _counterController.onIncrease,
                  tooltip: "Increment",
                  child: const Icon(CupertinoIcons.add),
                ),
                FloatingActionButton(
                  onPressed: _counterController.onDecrease,
                  tooltip: "Decrement",
                  child: const Icon(CupertinoIcons.minus),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(_counterController.countUp),
                Text(_counterController.countDown),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _counterController.onReset,
        tooltip: 'Increment',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
