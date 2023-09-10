package com.example.copy_n_sync

import android.content.ClipboardManager
import android.content.Context
import android.os.Bundle
import android.os.Handler
import android.util.Log
import android.view.View
import android.widget.Button
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import okhttp3.Call
import okhttp3.Callback
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody.Companion.toRequestBody
import okhttp3.Response
import okio.IOException

class CopyTextActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setContentView(R.layout.copy_text)
        val copy = findViewById<Button>(R.id.butto)
        copy.setOnClickListener {
            val clipBoardManager = getSystemService(Context.CLIPBOARD_SERVICE) as ClipboardManager
            val copiedString = clipBoardManager.primaryClip?.getItemAt(0)?.text?.toString()
            val prefs = getSharedPreferences("FlutterSharedPreferences", MODE_PRIVATE)
            val userId = prefs.getString("flutter."+"userId", "")
            val deviceId = prefs.getString("firebaseId", "")

            Log.d("Shared pref", userId + deviceId)

            val jsonText = escapeString(copiedString.toString())
            val postData = """{"userId" : "$userId","firebaseId":"$deviceId", "text":"$jsonText"}"""
            Log.d("clip2", copiedString.toString())
            if (userId == "") {
                Toast.makeText(context, "YOU HAVE NOT LOGGED IN YET", Toast.LENGTH_SHORT).show()
            } else {
                try {
                    val okHttpClient = OkHttpClient()
                    val requestBody = postData.toRequestBody()
                    val request = Request.Builder()
                        .method("POST", requestBody)
                        .url("https://copy-n-sync-backend.vercel.app/send/text")
                        .addHeader("Content-Type", "application/json")
                        .build()
                    okHttpClient.newCall(request).enqueue(object : Callback {
                        override fun onFailure(call: Call, e: IOException) {
                            Log.d("Error", e.toString())
                            Handler(mainLooper).post{
                                Toast.makeText(context, e.toString(), Toast.LENGTH_SHORT).show()
                            }
                            call.cancel()
                        }

                        override fun onResponse(call: Call, response: Response) {
                            Log.d("Success", response.toString())
                            Handler(mainLooper).post{
                                Toast.makeText(context, "Text Synced ✅", Toast.LENGTH_SHORT).show()
                            }
                            call.cancel()
                        }
                    })
                } catch (e: Exception){
                    Log.d("Exception", e.toString())
                }
            }


            finish()
        }

        val body = findViewById<View>(R.id.body)
        body.setOnClickListener {
            val clipBoardManager = getSystemService(Context.CLIPBOARD_SERVICE) as ClipboardManager
            val copiedString = clipBoardManager.primaryClip?.getItemAt(0)?.text?.toString()

            Log.d("clip2", copiedString.toString())


            finish()
        }
    }
    private fun escapeString(input: String): String {
        val escapedString = StringBuilder()
        for (c in input) {
            when (c) {
                '\\' -> escapedString.append("\\\\")
                '\"' -> escapedString.append("\\\"")
                '\n' -> escapedString.append("\\n")
                '\r' -> escapedString.append("\\r")
                '\t' -> escapedString.append("\\t")
                else -> escapedString.append(c)
            }
        }
        return escapedString.toString()
    }


}