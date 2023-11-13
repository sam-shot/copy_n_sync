package com.copy.sync
import android.Manifest
import android.app.Activity
import android.app.Notification
import android.app.PendingIntent
import android.content.ClipData
import android.content.ClipboardManager
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.media.MediaScannerConnection
import android.net.Uri
import android.os.Environment
import android.os.Handler
import android.util.Log
import android.widget.Toast
import androidx.core.app.ActivityCompat
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat
import androidx.core.content.ContextCompat
import com.google.firebase.messaging.FirebaseMessagingService
import com.google.firebase.messaging.RemoteMessage
import java.io.BufferedInputStream
import java.io.File
import java.io.FileOutputStream
import java.net.HttpURLConnection
import java.net.URL

class MyFirebaseMessagingService : FirebaseMessagingService() {

    override fun onMessageReceived(remoteMessage: RemoteMessage) {
        super.onMessageReceived(remoteMessage)

        Log.e("paste"," data!!")
        if (remoteMessage.data.isNotEmpty()) {
            if (remoteMessage.data["type"].toString() == "file") {
                val notificationIntent = Intent(Intent.ACTION_VIEW).apply {
                    data = Uri.parse(remoteMessage.data["message"].toString())
                    flags = Intent.FLAG_ACTIVITY_CLEAR_TOP
                }

                val pendingIntent = PendingIntent.getActivity(this, 0, notificationIntent, PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT)

                val notification = NotificationCompat.Builder(this, "Download_File")
                    .setContentTitle("You just received a file")
                    .setContentText("Click here to download the file.")
                    .setSmallIcon(R.drawable.download)
                    .setContentIntent(pendingIntent)
                    .setOngoing(true)
                    .setAutoCancel(true)
                    .build()

                NotificationManagerCompat.from(this).notify(8, notification)

            } else {

                val notificationIntent = Intent(this, ReceiveTextActivity::class.java)
                notificationIntent.putExtra("data", remoteMessage.data["message"].toString())
                notificationIntent.flags = Intent.FLAG_ACTIVITY_NEW_TASK

                val pendingIntent = PendingIntent.getActivity(this, 0, notificationIntent, PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT)

                val notification = NotificationCompat.Builder(this, "Copy n Sync")
                    .setContentTitle("You just received a text ")
                    .setContentText("Tap here to copy Text to your device")
                    .setSmallIcon(R.drawable.notify)
                    .setContentIntent(pendingIntent)
                    .setOngoing(true)
                    .setAutoCancel(true)
                    .build()
                NotificationManagerCompat.from(this).notify(6, notification)
            }

        }
    }







    override fun onNewToken(token: String) {
        super.onNewToken(token)

        val sharedPreferences =
            this.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
        Log.d("IDs", token)
        val editor = sharedPreferences.edit()
        editor.putString("firebaseId", token)
        editor.apply()

    }

}