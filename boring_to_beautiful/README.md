# MyArtist

A music player app where fans can keep up to date with their favorite artists.

<p align="center">
<img src="/boring_to_beautiful/images/pc.gif" alt="pc" />
</p>

<p align="center">
<img src="/boring_to_beautiful/images/mobile.gif" alt="mobile" width="350" />
</p>

## references

- [Flutter アプリを「退屈なアプリ」から「見栄えの良いアプリ」に変える](https://codelabs.developers.google.com/codelabs/flutter-boring-to-beautiful?hl=ja#0)
- [codelabs/boring_to_beautiful at main · flutter/codelabs](https://github.com/flutter/codelabs/tree/main/boring_to_beautiful)
  - [flutter_bloc | Flutter package](https://pub.dev/packages/flutter_bloc)
    - Flutter Widgets that make it easy to implement the BLoC (Business Logic Component) design pattern. Built to be used with the bloc state management package.
- [Material Theme Builder](https://material-foundation.github.io/material-theme-builder/)
- [Design tokens – Material Design 3](https://m3.material.io/foundations/design-tokens/overview)
  - adaptive breakpoints for mobile, tablet, pc
    - [Responsive layout grid - Material Design](https://m2.material.io/design/layout/responsive-layout-grid.html)
    - [Applying layout – Material Design 3](https://m3.material.io/foundations/layout/applying-layout/window-size-classes)

## what's?

## destination

ChatGPT

> Flutterにおける「destination」とは、通常、ナビゲーションに関連する用語で、アプリ内の特定の画面やページを指します。例えば、ユーザーがボタンをタップしたときに移動する先の画面を「destination」として指定します。この用語は特にNavigatorウィジェットやMaterialPageRouteなどを使用する際に使われます。

### flutter_bloc

ChatGPT

> Flutterアプリケーションにおけるビジネスロジックの管理を簡素化し、UIとビジネスロジックの分離を促進するためのデザインパターンです。このパターンを使用することで、アプリケーションの状態管理が容易になり、コードのテストがしやすくなります。

### part of

```dart
part of 'playback_bloc.dart';
```

ライブラリや大規模なコードベースを分割するために使用されるキーワードです。part ofを使うことで、複数のDartファイルを1つのライブラリとして扱い、モジュール化やコードの整理が容易になります

### class A with B {}

[file path](/boring_to_beautiful\lib\src\shared\playback\bloc\playback_event.dart)

- `part of`
- `@Freezed()`
- `class A with B`
  - `class A extends B`とは違う様子

```dart
part of 'playback_bloc.dart';

@Freezed()
class PlaybackEvent with _$PlaybackEvent {}
```

answer from ChatGPT

- `class A extends B`
  - 単一継承
  - クラスAはクラスBのすべての機能を継承し、オーバーライドできます
  - 強い継承関係を示します
- `class A with B`
  - 複数のミックスインを使用可能
  - クラスAはミックスインBの機能を利用でき、他の継承関係に影響を与えません
  - 再利用可能な機能を追加するために使用します

### extension A on B {}

[file path](/boring_to_beautiful\lib\src\shared\extensions.dart)

```dart
extension DurationString on String {
  /// Assumes a string (roughly) of the format '\d{1,2}:\d{2}'
  Duration toDuration() => switch (split(':')) {
        [var minutes, var seconds] => Duration(
            minutes: int.parse(minutes.trim()),
            seconds: int.parse(seconds.trim()),
          ),
        [var hours, var minutes, var seconds] => Duration(
            hours: int.parse(hours.trim()),
            minutes: int.parse(minutes.trim()),
            seconds: int.parse(seconds.trim()),
          ),
        _ => throw Exception('Invalid duration string: $this'),
      };
}
```

[file path](/boring_to_beautiful\lib\src\shared\providers\songs.dart)

```dart
final _songs = <RankedSong>[
  RankedSong(
    1,
    'Before You',
    ArtistsProvider.shared.getArtist('jmo')!,
    '2:45'.toDuration(),
    const MyArtistImage(
      image: 'assets/images/albums/artist6-album1.jpg',
      sourceLink: 'https://unsplash.com/photos/cTKGZJTMJQU',
      sourceName: 'Drew Dizzy Graham',
    ),
  ),
]
```

> Dart言語の機能で、既存のクラスに新しいメソッドやプロパティを追加する方法です。この機能を使用することで、既存のクラスの定義を変更することなく、そのクラスに新しい機能を追加できます。Flutterでもこの機能を利用して、標準ウィジェットや他のクラスにカスタムメソッドを追加することができます。(ChatGPT)

```dart
<!-- 文字列クラスに新しいメソッドを追加する例 -->
<!-- Palindrome means 回文 -->
extension StringExtension on String {
  bool get isPalindrome {
    String normalized = this.toLowerCase().replaceAll(RegExp(r'[\W_]+'), '');
    return normalized == normalized.split('').reversed.join('');
  }
}

void main() {
  String text = 'A man a plan a canal Panama';
  print(text.isPalindrome); // true
}
```
