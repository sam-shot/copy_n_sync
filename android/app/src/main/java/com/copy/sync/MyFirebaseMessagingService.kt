package com.copy.sync
import android.Manifest
import android.app.Activity
import android.content.ClipData
import android.content.ClipboardManager
import android.content.Context
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
        if (remoteMessage.data.isNotEmpty()) {
            if (remoteMessage.data["type"].toString() == "file") {
                downloadFile(remoteMessage.data["message"].toString())
            } else {
                copyToClipboard(remoteMessage.data["message"].toString())
            }

        }
    }

    private fun downloadFile(text: String?) {
        val permission = Manifest.permission.WRITE_EXTERNAL_STORAGE
        if (ContextCompat.checkSelfPermission(
                this,
                permission
            ) != PackageManager.PERMISSION_GRANTED
        ) {
            // Permission is not granted, request it
            ActivityCompat.requestPermissions(
                applicationContext as Activity,
                arrayOf(permission),
                123
            )
        }

        try {
            val url = URL(text)
            val connection: HttpURLConnection = url.openConnection() as HttpURLConnection
            connection.connect()

            val inputStream = BufferedInputStream(connection.inputStream)
            val outputDirectory = File(Environment.getExternalStorageDirectory(), "Copy N Sync")
            if (!outputDirectory.exists()) {
                outputDirectory.mkdirs()
            }
            val desiredFileName = text?.let { extractFileNameFromUrl(it) }
            val outputFileDir = desiredFileName?.let { File(outputDirectory, it) }
//            val outputFileDir = File(applicationContext.getExternalFilesDir(Environment.DIRECTORY_DOWNLOADS), desiredFileName)

            val outputStream = FileOutputStream(outputFileDir)
            val data = ByteArray(1024)
            var total: Long = 0
            var count: Int

            while (inputStream.read(data).also { count = it } != -1) {
                total += count
                outputStream.write(data, 0, count)
            }

            outputStream.flush()
            outputStream.close()
            inputStream.close()
            connection.disconnect()

            val completionNotification = NotificationCompat.Builder(this, "Copy n Sync")
                .setContentTitle("Download Complete")
                .setContentText("You just Received a File.✅")
                .setSmallIcon(R.drawable.notify)
                .build()
            NotificationManagerCompat.from(this).notify(6, completionNotification)
            val mediaScannerConnectionClient = object :
                MediaScannerConnection.MediaScannerConnectionClient {
                override fun onMediaScannerConnected() {
                    Log.e("hdf", outputFileDir?.path.toString())
                    if (outputFileDir != null) {
                        MediaScannerConnection.scanFile(applicationContext,
                            arrayOf(arrayOf(outputFileDir.path).toString()), null) { path, uri ->
                        }
                    }
                }

                override fun onScanCompleted(path: String?, uri: android.net.Uri?) {

                    Log.e("Scan complete oo", "Sacn naa")
                }
            }

            val mediaScannerConnection = MediaScannerConnection(applicationContext, mediaScannerConnectionClient)
            mediaScannerConnection.connect()

            stopSelf()
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }

    private fun extractFileNameFromUrl(url: String): String? {
        try {
            val uri = Uri.parse(url)
            val path = uri.path
            val segments = path?.split("/")
            return segments?.lastOrNull()
        } catch (e: Exception) {
            e.printStackTrace()
        }
        return null
    }

    private fun copyToClipboard(text: String?) {

        Handler(mainLooper).post {
            val clipboardManager = getSystemService(Context.CLIPBOARD_SERVICE) as ClipboardManager
            val clipData = ClipData.newPlainText("label", text)
            clipboardManager.setPrimaryClip(clipData)

            Toast.makeText(applicationContext, "Text Received from Copy n Sync", Toast.LENGTH_SHORT)
                .show()
        }
        val completionNotification = NotificationCompat.Builder(this, "Copy n Sync")
            .setContentTitle("Text Received")
            .setContentText("You just Received a Text.✅")
            .setSmallIcon(R.drawable.notify)
            .build()
        NotificationManagerCompat.from(this).notify(6, completionNotification)
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