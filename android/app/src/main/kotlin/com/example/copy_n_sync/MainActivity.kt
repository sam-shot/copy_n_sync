package com.example.copy_n_sync

import android.content.ClipboardManager
import android.content.Context
import android.os.Build
import android.os.Bundle
import android.os.Handler
import android.util.Log
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import okhttp3.Call
import okhttp3.Callback
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody.Companion.toRequestBody
import okhttp3.Response
import okio.IOException

class MainActivity: FlutterActivity() {

    private val METHOD_CHANNEL_NAME = "kotlinPlatform"

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
            } else if(call.method == "uploadFirebaseId")  {
                val prefs = this.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
                val deviceId = prefs.getString("firebaseId", "")
                val userId = prefs.getString("flutter."+"userId", "")
                val deviceName: String = Build.MODEL
                val postData = """{"userId" : "$userId","firebaseId":"$deviceId", "deviceName":"$deviceName"}"""

                postRequest(postData){ success ->
                    if (success) {
                        result.success("1")
                    } else {

                        result.success("0")
                    }
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
    }

    private fun postRequest(postData: String, callback: (Boolean) -> Unit){
        try {
            val okHttpClient = OkHttpClient()
            val requestBody = postData.toRequestBody()
            val request = Request.Builder()
                .method("POST", requestBody)
                .url("https://copy-n-sync-backend.vercel.app/user/updateDeviceId")
                .addHeader("Content-Type", "application/json")
                .build()
            okHttpClient.newCall(request).enqueue(object : Callback {
                override fun onFailure(call: Call, e: IOException) {
                    Log.d("Error", e.toString())
                    call.cancel()
                    callback(false)
                }

                override fun onResponse(call: Call, response: Response) {
                    Log.d("Success", "Device Registered Successfully ✅")
                    Handler(mainLooper).post{
                        Toast.makeText(applicationContext, "Device Registered Successfully ✅", Toast.LENGTH_LONG).show()
                    }
                    call.cancel()
                    callback(true)
                }
            })
        } catch (e: Exception){
            Log.d("Exception", e.toString())
            callback(false)
        }
    }



    
    
}
