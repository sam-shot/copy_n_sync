package com.copy.sync

import android.Manifest
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.ClipboardManager
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.media.MediaScannerConnection
import android.os.Build
import android.os.Bundle
import android.os.Environment
import android.util.Log
import androidx.core.app.ActivityCompat
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat
import androidx.core.content.ContextCompat
import com.google.firebase.messaging.FirebaseMessaging
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import java.io.File

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
            } else if(call.method == "getFirebaseId")  {
                val prefs = this.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
                val deviceId = prefs.getString("firebaseId", "")


                result.success(deviceId)
            } else if(call.method == "forgetDevice")  {
                FirebaseMessaging.getInstance().token.addOnCompleteListener { task ->
                    if (task.isSuccessful) {
                        val newToken = task.result
                        // Use the new token as needed
                        // Typically, you'd send it to your server or perform other actions
                        Log.d("TAG", "New FCM token: $newToken")
                    } else {
                        // Handle the error
                        Log.e("TAG", "Failed to retrieve FCM token: ${task.exception}")
                    }
                }



                result.success("deviceId")
            }else {
                result.notImplemented()
            }
        }
    }

    private fun teardownChannels(){
        methodChannel!!.setMethodCallHandler(null)
    }


    public override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        createNotificationChannel(context, "Sync Text", "Sync Latest Clipboard", "")
        createNotificationChannel(context, "Download_File", "Download File", "")




        val notificationIntent = Intent(context, CopyTextActivity::class.java)
        notificationIntent.flags = Intent.FLAG_ACTIVITY_NEW_TASK

        val pendingIntent = PendingIntent.getActivity(context, 0, notificationIntent, PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT)

        val notification = NotificationCompat.Builder(context, "Sync Text")
            .setContentTitle("Sync Across your Devices")
            .setContentText("Tap here to send Copied Text")
            .setSmallIcon(R.drawable.notify)
            .setContentIntent(pendingIntent)
            .setOngoing(true)
            .setAutoCancel(false)
            .build()
        NotificationManagerCompat.from(applicationContext).notify(4, notification)




    }


    private fun createNotificationChannel(context: Context, channelId: String, channelName: String, channelDescription: String) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(channelId, channelName, NotificationManager.IMPORTANCE_HIGH)
            channel.description = channelDescription
            val notificationManager = context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager

            notificationManager.createNotificationChannel(channel)
        }
    }








}