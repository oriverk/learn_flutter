# Codelab: Building Beautiful Transitions with Material Motion for Flutter

The Material motion system for Flutter is a set of transition patterns within
the [Animations package](https://pub.dev/packages/animations) that can help
users understand and navigate an app, as described in the
[Material Design guidelines](https://material.io/design/motion/the-motion-system.html).

This repo houses the source for the
[Material motion system codelab](https://codelabs.developers.google.com/codelabs/material-motion-flutter),
during which you will build Material transitions into an example email app
called Reply.

The starter code is available on the default `starter` branch, and the complete
code is available on the `complete` branch, which can you can checkout by
running `git checkout complete`.

| Android                                                                     | iOS                                                                 |
| --------------------------------------------------------------------------- | ------------------------------------------------------------------- |
| ![Reply transitions for Android](/material_motion_flutter/screenshots/reply-transitions-android.gif) | ![Reply transitions for iOS](/material_motion_flutter/screenshots/reply-transitions-iOS.gif) |

## what's

### InkWell VS GestureDetector

- [flutterアプリ開発においてInkWellとGestureDetectorどちらを採用するか](https://zenn.dev/yuv_o/articles/e8a3a12e73b8aa)
- [Gestures | Flutter](https://docs.flutter.dev/cookbook/gestures)

### SharedAxisTransition; アニメーション パッケージ内の共有軸移行

- アニメーション パッケージ内の共有軸移行は、SharedAxisTransition と呼ばれます。このウィジェットには次のプロパティがあります。
  - fillColor: 移行中の背景に使用される色。
  - animation: 子の出入りを操作するアニメーション。
  - secondaryAnimation: 新しいコンテンツが前面にプッシュされたときに子を移行させるアニメーション。
  - transitionType: 共有軸移行のタイプを、スケーリング、水平、垂直から選択します。
  - child: 移行しながら出入りするウィジェット。

## conclusions

アニメーションは最低限で良いんではないか。慣れの問題かもしれないが、`css`と比較して非常に複雑だと思う。個人的に[boring_to_beautifulのtheme.dart](/boring_to_beautiful\lib\src\shared\providers\theme.dart)のページ遷移時アニメーションぐらいで十分。

```dart
import 'package:flutter/material.dart';

class ThemeProvider extends InheritedWidget {
  <!-- ... -->

  final pageTransitionsTheme = const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.linux: NoAnimationPageTransitionsBuilder(),
      TargetPlatform.macOS: NoAnimationPageTransitionsBuilder(),
      TargetPlatform.windows: NoAnimationPageTransitionsBuilder(),
    },
  );

  <!-- ... -->
}
```
