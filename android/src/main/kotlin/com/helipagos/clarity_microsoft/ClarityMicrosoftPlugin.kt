package com.helipagos.clarity_microsoft

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

//import com.microsoft.clarity.Clarity
//import com.microsoft.clarity.ClarityConfig

import com.microsoft.c

/** ClarityMicrosoftPlugin */
class ClarityMicrosoftPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private var currentActivity: android.app.Activity? = null

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "clarity_microsoft")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when (call.method) {
      "getPlatformVersion" -> result.success("Android ${android.os.Build.VERSION.RELEASE}")
      "initClarity" -> {
          val projectId = call.argument<String>("projectId") ?: return result.error("INVALID_ARG", "Project ID required", null)
          val userId = call.argument<String>("userId") ?: return result.error("INVALID_ARG", "User ID required", null)

          val config = if (userId != null) {
              ClarityConfig(projectId, userId)
          } else {
              ClarityConfig(projectId)
          }
          Clarity.initialize(currentActivity, projectId)

          Log.d("ClarityMicrosoft", "Clarity initialized with projectId: $projectId and userId: $userId")
          result.success(null)
          else -> result.notImplemented()
  }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
