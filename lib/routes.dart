import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_go_router_tutorial/a_page.dart';
import 'package:flutter_go_router_tutorial/b_details_page.dart';
import 'package:flutter_go_router_tutorial/b_page.dart';
import 'package:flutter_go_router_tutorial/home_page.dart';
import 'package:flutter_go_router_tutorial/signin_page.dart';
import 'package:go_router/go_router.dart';

final goRouter = GoRouter(
  // アプリが起動して最初に開かれる画面
  initialLocation: '/',
  // パスと画面の組み合わせ
  routes: [
    GoRoute(
      path: '/',
      name: 'initial', // context.goNamed('name')を使うときに呼ぶnameがこれにあたる
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: HomePage(),
        );
      },
    ),
    GoRoute(
      path: '/signin',
      name: 'signin',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: SignInPage(),
        );
      },
    ),
    GoRoute(
      path: '/a',
      name: 'a',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const APage(),
        );
      },
    ),
    GoRoute(
      path: '/b',
      name: 'b',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const BPage(),
        );
      },
    ),
    GoRoute(
      path: '/b-details',
      name: 'bDetails',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: BDetailsPage(title: state.extra as String),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
  ],
  // 無効なパスにアクセスした時に遷移する画面の設定
  errorPageBuilder: (context, state) => MaterialPage(
    key: state.pageKey,
    child: Scaffold(
      body: Center(
        child: Text(state.error.toString()),
      ),
    ),
  ),
  // リダイレクト
  // 遷移のたびに現在の状態を確認し、条件に応じてリダイレクトが実行される
  redirect: (BuildContext context, GoRouterState state) {
    // 例：ユーザー認証でサインインしていなかったらサインイン画面に遷移させる
    bool isSignedIn = Random().nextBool(); //認証状況をランダムに設定
    if (!isSignedIn) {
      return '/signin';
    } else {
      // 該当しない場合は意図した先に遷移
      return null;
    }
  },
);
