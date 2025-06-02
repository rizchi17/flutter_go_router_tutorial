import 'package:flutter/material.dart';
import 'package:flutter_go_router_tutorial/pages/a_page.dart';
import 'package:flutter_go_router_tutorial/pages/b_details_page.dart';
import 'package:flutter_go_router_tutorial/pages/b_page.dart';
import 'package:flutter_go_router_tutorial/pages/error_page.dart';
import 'package:flutter_go_router_tutorial/pages/home_page.dart';
import 'package:flutter_go_router_tutorial/pages/signin_page.dart';
import 'package:flutter_go_router_tutorial/provider/authentication_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

GoRouter createGoRouter(WidgetRef ref) {
  final authNotifier = ref.watch(authNotifierProvider.notifier);
  final authState = ref.watch(authNotifierProvider);

  return GoRouter(
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
        routes: [
          GoRoute(
            path: 'a',
            name: 'a',
            pageBuilder: (context, state) {
              return MaterialPage(
                key: state.pageKey,
                child: const APage(),
              );
            },
          ),
          GoRoute(
            path: 'b',
            name: 'b',
            pageBuilder: (context, state) {
              return MaterialPage(
                key: state.pageKey,
                child: const BPage(),
              );
            },
            // ネストされたルーティングを設定できる
            // 親子関係を表現できる
            routes: [
              GoRoute(
                path: 'details',
                name: 'bDetails',
                pageBuilder: (context, state) {
                  // 遷移時のアニメーションもここで設定できる
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
          ),
        ],
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
    ],

    // 無効なパスにアクセスした時に遷移する画面の設定
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: ErrorPage(
        errorMessage: state.error.toString(),
      ),
    ),
    refreshListenable: authNotifier,
    // リダイレクト
    // 遷移のたびに現在の状態を確認し、条件に応じてリダイレクトが実行される
    // context.pop() 時は呼ばれない
    redirect: (BuildContext context, GoRouterState state) {
      // 認証状態を取得
      final isLoggedIn = authState.isLoggedIn;
      // 現在のパスがサインインページかどうかを確認
      final isOnSignIn = state.matchedLocation == '/signin';

      if (!isLoggedIn && !isOnSignIn) {
        // 未ログインならサインインページへ
        return '/signin';
      }
      if (isLoggedIn && isOnSignIn) {
        // ログイン済みでサインインページにいるならホームへ
        return '/';
      }
      // それ以外はリダイレクトしない
      return null;
    },
  );
}
