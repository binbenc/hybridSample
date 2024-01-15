package com.cxb.android.hybridsample

import android.content.Context
import android.content.Intent
import androidx.core.content.ContextCompat.startActivity
import io.flutter.FlutterInjector
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterActivityLaunchConfigs
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.FlutterEngineGroup
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.MethodChannel


object FlutterUtils {
    const val HYBRID_ENGINE_ID = "hybrid"

     lateinit var context: Context
    private lateinit var flutterEngines: FlutterEngineGroup
    private lateinit var hybridFlutterEngine: FlutterEngine

    private lateinit var hybridMethodChannel: MethodChannel

    fun init() {
        flutterEngines = FlutterEngineGroup(context)

        // Flutter - hybrid
        val hybridEntrypoint = DartExecutor.DartEntrypoint(
            FlutterInjector.instance().flutterLoader().findAppBundlePath(),
            "hybridMain"
        )
        hybridFlutterEngine = flutterEngines.createAndRunEngine(context, hybridEntrypoint)
//        hybridFlutterEngine.navigationChannel.setInitialRoute("main/detail")
        FlutterEngineCache.getInstance().put(HYBRID_ENGINE_ID, hybridFlutterEngine)
        hybridMethodChannel =
            MethodChannel(hybridFlutterEngine.dartExecutor, "com.cxb.flutter.hybrid")
        hybridMethodChannel.setMethodCallHandler { call, result ->
            when (call.method) {

            }
        }
    }

    fun toFlutter(context: Context,params:Any){
        sendMessage(params)
        launchHybridFunc()
    }

    fun sendMessage(obj:Any){
        hybridMethodChannel.invokeMethod("navigateToPage","111111")
    }

    fun launchHybridFunc() {
        val intent = FlutterActivity
            .withCachedEngine(HYBRID_ENGINE_ID)
            .build(context)
            .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)


        context.startActivity(intent)
    }

    fun navigateToPage(pageName: String) {
        hybridMethodChannel.invokeMethod("navigateToPage", pageName)
    }

}