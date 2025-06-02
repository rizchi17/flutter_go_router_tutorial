import 'package:flutter/material.dart';
import 'package:flutter_go_router_tutorial/provider/authentication_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('SignIn Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                ref.read(authNotifierProvider.notifier).logIn();
                // 意図的に遷移をしなくてもrefreshListenableで監視しているので
                // GoRouterが自動的に画面遷移を行う
                
                // context.go('/')
              },
              child: Text('Log In'),
            ),
          ],
        ),
      ),
    );
  }
}
