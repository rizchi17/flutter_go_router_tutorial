import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BPage extends StatefulWidget {
  const BPage({super.key});

  @override
  State<BPage> createState() => _BPageState();
}

class _BPageState extends State<BPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('B Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => context.pop(),
              child: Text('pop to Home Page'),
            ),
            ElevatedButton(
              onPressed: () => context.push('/b/details', extra: 'B details Page'),
              child: Text('push to B Page'),
            ),
          ],
        ),
      ),
    );
  }
}
