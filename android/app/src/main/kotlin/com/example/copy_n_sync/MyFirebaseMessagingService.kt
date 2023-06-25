package com.example.copy_n_sync
import android.content.ClipData
import android.content.ClipboardManager
import android.content.Context
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.widget.Toast
import com.google.firebase.messaging.FirebaseMessagingService
import com.google.firebase.messaging.RemoteMessage
import okhttp3.Call
import okhttp3.Callback
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody.Companion.toRequestBody
import okhttp3.Response
import okio.IOException

class MyFirebaseMessagingService : FirebaseMessagingService(){

    override fun onMessageReceived(remoteMessage: RemoteMessage) {
        super.onMessageReceived(remoteMessage)
        if (remoteMessage.data.isNotEmpty()) {
            val data = remoteMessage.data["message"]
            val message = data.toString()
            copyToClipboard(message)
            Log.d("Refreshed Message", data.toString())
        }
    }

    private fun copyToClipboard(text: String?) {

        Handler(mainLooper).post{
            val clipboardManager = getSystemService(Context.CLIPBOARD_SERVICE) as ClipboardManager
            val clipData = ClipData.newPlainText("label", text)
            clipboardManager.setPrimaryClip(clipData)
            Toast.makeText(applicationContext, "Text Received from Copy n Sync", Toast.LENGTH_SHORT).show()
        }
    }

    override fun onNewToken(token: String) {
        super.onNewToken(token)

        val sharedPreferences = this.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
        Log.d("IDs", token)
        val editor = sharedPreferences.edit()
        editor.putString("firebaseId", token)
        editor.apply()

    }

}