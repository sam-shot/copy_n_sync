package com.copy.sync

import android.content.ClipData
import android.content.ClipboardManager
import android.content.Context
import android.os.Bundle
import android.os.Handler
import android.util.Log
import android.widget.Toast
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat
import io.flutter.embedding.android.FlutterActivity

class ReceiveTextActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_receive_text)

        val data = intent.getStringExtra("data")
        Handler(mainLooper).post {
            val clipboardManager = getSystemService(Context.CLIPBOARD_SERVICE) as ClipboardManager
            val clipData = ClipData.newPlainText("label", data)
            clipboardManager.setPrimaryClip(clipData)
            Log.e("paste", data!!)
            Toast.makeText(applicationContext, "Text Received from Copy n Sync .✅", Toast.LENGTH_SHORT)
                .show()
        }

        finish()
    }
}