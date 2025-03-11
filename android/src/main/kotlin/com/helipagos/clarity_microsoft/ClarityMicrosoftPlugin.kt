package com.helipagos.clarity_microsoft

import android.content.Context
import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import com.microsoft.clarity.Clarity
import com.microsoft.clarity.ClarityConfig

class ClarityMicrosoftPlugin: FlutterPlugin, MethodCallHandler {
  private lateinit var channel: MethodChannel
  private lateinit var applicationContext: Context

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "clarity_microsoft")
    channel.setMethodCallHandler(this)
    // Guardamos el applicationContext para usarlo en la inicialización
    applicationContext = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when (call.method) {
      "getPlatformVersion" -> {
        result.success("Android ${android.os.Build.VERSION.RELEASE}")
      }
      "initClarity" -> {
          val projectId = call.argument<String>("projectId")
              ?: return result.error("INVALID_ARG", "Project ID required", null)
          val userId = call.argument<String>("userId")
          // Crear ClarityConfig según si se proporciona userId o no.
          val config = if (!userId.isNullOrEmpty()) {
              ClarityConfig(projectId, userId)
          } else {
              ClarityConfig(projectId)
          }
          // Inicializamos Clarity usando applicationContext y la configuración creada
          Clarity.initialize(applicationContext, config)
          Log.d("ClarityMicrosoft", "Clarity initialized with projectId: $projectId and userId: ${userId ?: "not provided"}")
          result.success(null)
      }
      else -> result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
