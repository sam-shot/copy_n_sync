package com.example.copy_n_sync

import android.app.ActivityManager
import android.content.ClipboardManager
import android.content.Context
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    private val METHOD_CHANNEL_NAME = "clipboard"

    private var methodChannel: MethodChannel? = null
    private lateinit var clipboardManager: ClipboardManager

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        setupChannels(this, flutterEngine.dartExecutor.binaryMessenger)

    }

    override fun onDestroy() {
        teardownChannels()
        super.onDestroy()
    }

    private fun setupChannels(context: Context, messenger: BinaryMessenger){
        clipboardManager = context.getSystemService(Context.CLIPBOARD_SERVICE) as ClipboardManager
        methodChannel = MethodChannel(messenger, METHOD_CHANNEL_NAME)
        methodChannel!!.setMethodCallHandler { call, result ->
            if (call.method == "getClipData") {
                val clipData = clipboardManager.primaryClip
                if (clipData != null && clipData.itemCount > 0) {
                    val latestText = clipData.getItemAt(0).text.toString()
                    result.success(latestText)
                } else {
                    result.success("")
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun teardownChannels(){
        methodChannel!!.setMethodCallHandler(null)
    }

    public override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        isAppRunning = isAppRunning(this)
    }

    companion object {
        var isAppRunning = false
            private set

        fun isAppRunning(context: Context): Boolean {
            val packageName = context.packageName
            val activityManager = context.getSystemService(ACTIVITY_SERVICE) as ActivityManager
            val processInfo = activityManager.runningAppProcesses
            if (processInfo != null) {
                for (info in processInfo) {
                    if (info.processName == packageName) {
                        return true
                    }
                }
            }
            return false
        }

        fun getIsAppRunning(): Boolean {
            return isAppRunning
        }


    }

    
    
}
