# learn_flutter

## Projects

### 写経

- [qiita_search](/qiita_search/)
  - [いちから始めるFlutterモバイルアプリ開発](https://zenn.dev/heyhey1028/books/flutter-basics)
    - http, webview_flutter
- [codelab_first_app](/codelab_first_app/)
  - [初めての Flutter アプリ](https://codelabs.developers.google.com/codelabs/flutter-codelab-first?hl=ja#0)
- [testing_app](/testing_app/)
  - [Flutter アプリのテスト方法](https://codelabs.developers.google.com/codelabs/flutter-app-testing?hl=ja#0)
    - routing with go_router, tests; unit test, widget test, perf test
- [google_maps](/google_maps/)
  - [Flutter アプリに Google マップを追加する  |  Google Codelabs](https://codelabs.developers.google.com/codelabs/google-maps-in-flutter?hl=ja#0)
    - google_maps_flutter, http, json_serializable
- [mdc101_flutter](/mdc101_flutter/)
  - [MDC-101 Flutter: マテリアル コンポーネントの基本](https://codelabs.developers.google.com/codelabs/mdc-101-flutter?hl=ja#0)
  - backdrops, custom fonts, gridview
- [animated_responsive_layout](/animated_responsive_layout/)
  - [マテリアル 3 でアニメーション化されたレスポンシブ アプリ レイアウトを作成する](https://codelabs.developers.google.com/codelabs/flutter-animated-responsive-layout?hl=ja#0)
- [borring_to_beautiful](/boring_to_beautiful/)
  - [Flutter アプリを「退屈なアプリ」から「見栄えの良いアプリ」に変える](https://codelabs.developers.google.com/codelabs/flutter-boring-to-beautiful?hl=ja#0)
- [material_motion_flutter](/material_motion_flutter/)
  - [Flutter 用のマテリアル モーションで美しい移行を作成する](https://codelabs.developers.google.com/codelabs/material-motion-flutter?hl=ja#0)
  - [memo in material_motion_flutter/README](/material_motion_flutter/README.md)
- [battery_level_app](/battery_level_app/)
  - [Platform-specific code | Flutter](https://docs.flutter.dev/platform-integration/platform-channels)
    - [電池残量と充電状態を監視する  |  App quality  |  Android Developers](https://developer.android.com/training/monitoring-device-state/battery-monitoring?hl=ja#kotlin)
- [good_to_know_flutter_with_firebase](/gtk_flutter/)
  - [Firebase for Flutter を理解する](https://firebase.google.com/codelabs/firebase-get-to-know-flutter?hl=ja#0)
  - [codelabs/firebase-get-to-know-flutter at main · flutter/codelabs](https://github.com/flutter/codelabs/tree/main/firebase-get-to-know-flutter)
    - [firebase/flutterfire: 🔥 A collection of Firebase plugins for Flutter apps.](https://github.com/firebase/flutterfire)

<!-- ### 模写

- X (Twitter)
  - List、画像撮影・投稿
- Instagram
  - List、画像OR動画撮影・投稿・加工
- SALKO
  - GPS情報、Fitness情報
- デジタル庁アプリ
  - N列グリッドベース
- PayPay様アプリ
  - Wiget多め -->

## Command

### Create Project

flutter createの後に-eを付ける事で最小構成のプロジェクトを作成する事ができます。

```shell
flutter create -e [project_name] --platforms=ios,android
```

- [XユーザーのAndrea Bizzotto 💙さん: 「Want to create an "empty" Flutter project without all the boilerplate code? Then simply pass a "-e" flag on the command line. Example: flutter create -e test_app This will generate minimal pubspec.yaml and main.dart files (without any comments). 👇 https://t.co/HqsCSdfNZn」 / X](https://x.com/biz84/status/1663204152032231425)

### Run App

```shell
flutter devices
flutter run -d [device_id]
```

### Flutter run key commands

```md
- r: Hot reload.
- R: Hot restart.
- v: Open Flutter DevTools.
- s: Save a screenshot to flutter.png.
- w: Dump widget hierarchy to the console.                                               (debugDumpApp)
- t: Dump rendering tree to the console.                                          (debugDumpRenderTree)
- L: Dump layer tree to the console.                                               (debugDumpLayerTree)
- f: Dump focus tree to the console.                                               (debugDumpFocusTree)
- S: Dump accessibility tree in traversal order.                                   (debugDumpSemantics)
- U: Dump accessibility tree in inverse hit test order.                            (debugDumpSemantics)
- i: Toggle widget inspector.                                  (WidgetsApp.showWidgetInspectorOverride)
- p: Toggle the display of construction lines.                                  (debugPaintSizeEnabled)
- I: Toggle oversized image inversion.                                     (debugInvertOversizedImages)
- o: Simulate different operating systems.                                      (defaultTargetPlatform)
- b: Toggle platform brightness (dark and light mode).                        (debugBrightnessOverride)
- P: Toggle performance overlay.                                    (WidgetsApp.showPerformanceOverlay)
- a: Toggle timeline events for all widget build methods.                    (debugProfileWidgetBuilds)
- M: Write SkSL shaders to a unique file in the project directory.
- g: Run source code generators.
- j: Dump frame raster stats for the current frame. (Unsupported for web)
- h: Repeat this help message.
- d: Detach (terminate "flutter run" but leave application running).
- c: Clear the screen
- q: Quit (terminate the application on the device).
```

## refernces

### pub

hoge

### flutter documents

hoge

### vscode extensions

- [dart-import - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=luanpotter.dart-import)
  - Fix Dart/Flutter's imports
