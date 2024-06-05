import 'package:flutter/material.dart';
import 'package:posts_bloc/base/screens/base_widget.dart';
import 'package:posts_bloc/ui/temp/counter_vm.dart';
import 'package:provider/provider.dart';

class Test extends BaseWidget {
  const Test({super.key});

  @override
  BaseWidgetState<BaseWidget> getState() => _TestState();
}

class _TestState extends BaseWidgetState<Test> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterVm>(
      create: (BuildContext context) => CounterVm(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text("ChangeNotifier Example"),
          centerTitle: true,
        ),
        body: Center(
          child: Builder(builder: (context) {
            final counter = Provider.of<CounterVm>(context, listen: true);
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: counter.increment, icon: const Icon(Icons.add)),
                Consumer<CounterVm>(
                    builder: (context, counter, child) => Text(
                          '${counter.count}',
                          style: const TextStyle(fontSize: 20),
                        )),
                Visibility(
                  visible: (counter.count > 0),
                  replacement: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Limit Reached")),
                  child: IconButton(
                      onPressed: counter.decrement,
                      icon: const Icon(Icons.remove)),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
