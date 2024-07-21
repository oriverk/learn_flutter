package com.example.batterylevel

import androidx.annotation.NonNull

import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
  private val BATTERY_CHANNEL = "samples.flutter.dev/battery"
  private val CHARGING_CHANNEL = "samples.flutter.dev/charging"

  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)

    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, BATTERY_CHANNEL).setMethodCallHandler {
      call, result ->
      // This method is invoked on the main thread.
      if(call.method == "getBatteryLevel") {
        val batteryLevel = getBatteryLevel()

        if(batteryLevel != -1) {
          result.success(batteryLevel)
        } else {
          result.error("UNVAILABLE", "Battery level not available.", null)
        }
      } else {
        result.notImplemented()
      }

    }
  }

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

  // private fun getChargingStatus(): Boolean {
  //   val batteryStatus: Intent? = IntentFilter(Intent.ACTION_BATTERY_CHANGED).let { ifilter ->
  //     context.registerReceiver(null, ifilter)
  //   }

  //   val status: Int = batteryStatus?.getIntExtra(BatteryManager.EXTRA_STATUS, -1) ?: -1
  //   val isCharging: Boolean = status == BatteryManager.BATTERY_STATUS_CHARGING
  //       || status == BatteryManager.BATTERY_STATUS_FULL

  //   return isCharging
  // }

  // private fun getChargingWith(): String {
  //   val batteryStatus: Intent? = IntentFilter(Intent.ACTION_BATTERY_CHANGED).let { ifilter ->
  //     context.registerReceiver(null, ifilter)
  //   }

  //   // How are we charging?
  //   val chargePlug: Int = batteryStatus?.getIntExtra(BatteryManager.EXTRA_PLUGGED, -1) ?: -1
  //   val usbCharge: Boolean = chargePlug == BatteryManager.BATTERY_PLUGGED_USB
  //   val acCharge: Boolean = chargePlug == BatteryManager.BATTERY_PLUGGED_AC
  //   val chargeWith: String = usbCharge ? "usb" : acCharge ? "ac" : "unknown";

  //   return chargeWith
  // }
}
