# batterylevel

Example: Calling platform-specific code using platform channels

## reference

- [Platform-specific code | Flutter](https://docs.flutter.dev/platform-integration/platform-channels)
  - [FlutterJourney/Native Code in Flutter at main · EnricoGollner/FlutterJourney](https://github.com/EnricoGollner/FlutterJourney/tree/main/Native%20Code%20in%20Flutter)
  - [電池残量と充電状態を監視する  |  App quality  |  Android Developers](https://developer.android.com/training/monitoring-device-state/battery-monitoring?hl=ja#kotlin)

> By default, our template supports writing Android code using Kotlin, or iOS code using Swift. To use Java or Objective-C, use the -i and/or -a flags:

```shell
flutter create -i objc -a java batterylevel
```

## memo

### Which AndroidManifest.xml to edit in Flutter project?

- [android studio - Which AndroidManifest.xml to edit in Flutter project? - Stack Overflow](https://stackoverflow.com/questions/60095118/which-androidmanifest-xml-to-edit-in-flutter-project)

> Main AndroidManifest.xml file is located at 'Project' > app > src > main > AndroidManifest.xml.


> Other AndroidManifest.xml which are in debug folder and profile folder are systems generated when you are running a flutter app directly to mobile it will generate or while creating a flutter project. E.g: It is used for hot reload when the device is connected.

### 電池残量と充電状態を監視する

- [電池残量と充電状態を監視する  |  App quality  |  Android Developers](https://developer.android.com/training/monitoring-device-state/battery-monitoring?hl=ja#kotlin)

#### 現在の充電状態を特定する

- [MainActivity.kt](/batterylevel/android/app/src/main/kotlin/com/example/batterylevel/MainActivity.kt)
- [BatteryEventChannel.kt](/batterylevel/android/app/src/main/kotlin/com/example/batterylevel/BatteryEventChannel.kt)
- [電池残量と充電状態を監視する  |  App quality  |  Android Developers](https://developer.android.com/training/monitoring-device-state/battery-monitoring?hl=ja#kotlin)

充電状態の変化を監視する

```kotlin
val batteryStatus: Intent? = IntentFilter(Intent.ACTION_BATTERY_CHANGED).let { ifilter ->
    context.registerReceiver(null, ifilter)
}
```

```kotlin
val status: Int = batteryStatus?.getIntExtra(BatteryManager.EXTRA_STATUS, -1) ?: -1
val isCharging: Boolean = status == BatteryManager.BATTERY_STATUS_CHARGING
        || status == BatteryManager.BATTERY_STATUS_FULL

// How are we charging?
val chargePlug: Int = batteryStatus?.getIntExtra(BatteryManager.EXTRA_PLUGGED, -1) ?: -1
val usbCharge: Boolean = chargePlug == BatteryManager.BATTERY_PLUGGED_USB
val acCharge: Boolean = chargePlug == BatteryManager.BATTERY_PLUGGED_AC
```

現在の電池残量を特定する

```kotlin
private fun getBatteryLevel(): Int {
    val batteryLevel: Int

    if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
      val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
      batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
    } else {
      // val intent = ContextWrapper(applicationContext).registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
      // val level: Int = intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1)
      // val scale: Int = intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
      // batteryLevel = level * 100 / scale

      // https://developer.android.com/training/monitoring-device-state/battery-monitoring?hl=ja#kotlin
      val batteryStatus: Intent? = IntentFilter(Intent.ACTION_BATTERY_CHANGED).let { ifilter ->
        context.registerReceiver(null, ifilter)
      }
      val batteryPct: Float? = batteryStatus?.let { intent ->
        val level: Int = intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1)
        val scale: Int = intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
        level * 100 / scale.toFloat()
      }
      batteryLevel = batteryPct as Int
    }

    return batteryLevel
  }
```

- 条件式 VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP
  - デバイスがAndroid Lollipop（APIレベル21）以上のバージョンで動作しているかどうかをチェック
- VERSION.SDK_INT
  - デバイスで実行されているAndroidのバージョンを取得するための定数
- VERSION_CODES.LOLLIPOP
  - AndroidのバージョンLollipop（APIレベル21）を示す定数
