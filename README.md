# flutter_go_router_tutorial

[go_router](https://pub.dev/packages/go_router)についての理解を深める

## go_router とは
- routesにすべてのルートを一元管理できる
- 各ルートに 独自のアニメーション付きページ遷移を指定できる
- リダイレクトの設定ができる
- Deep Linkに対応（Deep Link経由で特定のページに遷移する場合、パスパラメータが有効）

### メソッド
- `context.go()` : スタックを全てクリアして新しいページに遷移(a->b => c)
- `context.pushReplacement()` : 現在のページを新しいページで置き換える(a->b => a->c)
- `context.replace()` : 現在のページを新しいページで置き換えるが、履歴は保持される(a->b => a->c)
- `context.push()` : 現在の位置にpush
- `context.pop()` : 現在の位置からpop
- `context.xxxNamed()` : 新しいページをURLではなくnameで指定する
- `context.namedLocation()` : nameを引数に入れて、URLを返す(場所を検索してgo()で移動するなどで使える)
- `context.canPop()` : popできるかを判定する(boolを返す)

### 値渡し
#### extra
`context.go('/details', extra: '123');`

#### queryParameters
`context.go('/details?id=123');`

## go_router 以外のルーター
- Navigator(1.0, 2.0): Flutterの標準的な画面遷移
- GetX: パッケージ
- Fluro: パッケージ
- AutoRoute: パッケージ

# やってみたいこと
- Deep link

