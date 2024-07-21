import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  static const MethodChannel platform =
      MethodChannel('samples.flutter.dev/battery');
  // static const EventChannel eventChannel =
  //     EventChannel('samples.flutter.dev/charging');

  String _batteryLevel = 'Unknown battery level.';
  // String _chargingStatus = 'Battery status: unknown.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final result = await platform.invokeMethod<int>('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
  // }

  // void _onEvent(Object? event) {
  //   debugPrint("event: $event");
    
  //   setState(() {
  //     _chargingStatus =
  //         "Battery status: ${event == 'charging' ? '' : 'dis'}charging.";
  //   });
  // }

  // void _onError(Object error) {
  //   setState(() {
  //     _chargingStatus = 'Battery status: unknown.';
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_batteryLevel, key: const Key('Battery level label')),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: _getBatteryLevel,
                  child: const Text('Refresh'),
                ),
              ),
            ],
          ),
          // Text(_chargingStatus),
        ],
      ),
    );
  }
}
