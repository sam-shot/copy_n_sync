package com.copy.sync


import android.content.Intent
import android.os.Bundle
import android.os.Handler
import android.util.Log
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import okhttp3.Call
import okhttp3.Callback
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody.Companion.toRequestBody
import okhttp3.Response
import okio.IOException

class ContextMenu : FlutterActivity() {

    public override fun onCreate(savedInstanceState: Bundle?) {



        super.onCreate(savedInstanceState)

        if(intent.action == Intent.ACTION_PROCESS_TEXT){
            val selectedText = intent.getStringExtra(Intent.EXTRA_PROCESS_TEXT)
            val prefs = getSharedPreferences("FlutterSharedPreferences", MODE_PRIVATE)
            val userId = prefs.getString("flutter."+"userId", "")
            val deviceId = prefs.getString("firebaseId", "")

            Log.d("Shared pref", userId + deviceId)

            val jsonText = escapeString(selectedText!!)
            val postData = """{"userId" : "$userId","firebaseId":"$deviceId", "text":"$jsonText"}"""


            if (userId == ""){
                Handler(mainLooper).post{
                    Toast.makeText(applicationContext, "YOU HAVE NOT LOGGED IN YET", Toast.LENGTH_SHORT).show()
                }
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
                                Toast.makeText(applicationContext, e.toString(), Toast.LENGTH_SHORT).show()
                            }
                            call.cancel()
                        }

                        override fun onResponse(call: Call, response: Response) {
                            Log.d("Success", response.toString())
                            Handler(mainLooper).post{
                                Toast.makeText(applicationContext, "Text Synced ✅", Toast.LENGTH_SHORT).show()
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