# todo_flutter

FlutterのTODO アプリ

## Getting Started

### Git Hooksの設定

Git Hooksを設定することにより、以下実行する。
- コミット時: `formatter`
- プッシュ時: `linter`, `test`

```sh
chmod -R +x githooks/
cp -fr githooks/ .git/hooks
```

## Environment

### Formatter, Linter

- Formatter: [Effective Dart](https://dart.dev/guides/language/effective-dart)
- Linter: [lint](https://pub.dev/packages/lint)
