# learn_flutter

## Projects

- [qiita_search](/qiita_search/)

## Command

### Create Project

flutter createの後に-eを付ける事で最小構成のプロジェクトを作成する事ができます。

```shell
flutter create -e [project_name]
```

- [XユーザーのAndrea Bizzotto 💙さん: 「Want to create an "empty" Flutter project without all the boilerplate code? Then simply pass a "-e" flag on the command line. Example: flutter create -e test_app This will generate minimal pubspec.yaml and main.dart files (without any comments). 👇 https://t.co/HqsCSdfNZn」 / X](https://x.com/biz84/status/1663204152032231425)

### Run App

```shell
flutter devices
flutter run -d [device_id]
```

### Flutter run key commands

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
