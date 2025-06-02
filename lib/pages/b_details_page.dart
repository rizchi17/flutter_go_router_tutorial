import 'package:flutter/material.dart';
import 'package:flutter_go_router_tutorial/provider/authentication_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BDetailsPage extends ConsumerStatefulWidget {
  const BDetailsPage({super.key, required this.title});
  final String title;

  @override
  ConsumerState<BDetailsPage> createState() => _BDetailsPageState();
}

class _BDetailsPageState extends ConsumerState<BDetailsPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(authNotifierProvider.notifier).logOut();
              },
              child: Text('Log Out'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
