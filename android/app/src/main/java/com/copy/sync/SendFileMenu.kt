package com.copy.sync

import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.os.Handler
import android.util.Log
import android.webkit.MimeTypeMap
import android.widget.Toast
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat
import io.flutter.embedding.android.FlutterActivity
import okhttp3.Call
import okhttp3.Callback
import okhttp3.MediaType.Companion.toMediaTypeOrNull
import okhttp3.MultipartBody
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody
import okhttp3.Response
import java.io.File
import java.io.FileOutputStream
import java.io.IOException
import java.io.InputStream

class SendFileMenu : FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val action = intent.action
        val type = intent.type

        if (Intent.ACTION_SEND == action && type != null) {

                val sharedPdfUri = intent.clipData?.getItemAt(0)?.uri
            Log.d("File", type)

                if (sharedPdfUri != null) {
                    Log.d("File", sharedPdfUri.toString())

                    val file = copyFileFromContentUri(sharedPdfUri, type)
                    if (file != null) {
                        if (file.exists()) {

                            var length = file.length() / 1024
                            if(length > 5120) {
                                val completionNotification = NotificationCompat.Builder(this, "Copy n Sync")
                                    .setContentTitle("Upload Failed")
                                    .setContentText("Please select a file < 5mb")
                                    .setSmallIcon(R.drawable.notify)
                                    .build()
                                NotificationManagerCompat.from(this).notify(6, completionNotification)
                                file.delete()
                            } else {
                                if (length > 1000){
                                    val prefs = getSharedPreferences("FlutterSharedPreferences", MODE_PRIVATE)
                                    val userId = prefs.getString("flutter."+"userId", "")
                                    val deviceId = prefs.getString("firebaseId", "")

                                    try {
                                        val okHttpClient = OkHttpClient()
                                        val requestBody = MultipartBody.Builder()
                                            .setType(MultipartBody.FORM)
                                            .addFormDataPart("userId", userId!!)
                                            .addFormDataPart("deviceId", deviceId!!)
                                            .addFormDataPart("file", generateRandomString(8)+file.name, RequestBody.create(
                                                "application/octet-stream".toMediaTypeOrNull(), file))
                                            .build()

                                        val request = Request.Builder()
                                            .url("https://copy-n-sync-backend.vercel.app/upload")
                                            .post(requestBody)
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

                                                    val completionNotification = NotificationCompat.Builder(context, "Copy n Sync")
                                                        .setContentTitle("Upload Complete")
                                                        .setContentText("You just uploaded a File")
                                                        .setSmallIcon(R.drawable.notify)
                                                        .build()
                                                    NotificationManagerCompat.from(context).notify(6, completionNotification)

                                                call.cancel()
                                            }
                                        })
                                    } catch (e: Exception){
                                        Log.d("Exception", e.toString())
                                    }

                                } else {
                                    val prefs = getSharedPreferences("FlutterSharedPreferences", MODE_PRIVATE)
                                    val userId = prefs.getString("flutter."+"userId", "")
                                    val deviceId = prefs.getString("firebaseId", "")

                                    try {
                                        val okHttpClient = OkHttpClient()
                                        val requestBody = MultipartBody.Builder()
                                            .setType(MultipartBody.FORM)
                                            .addFormDataPart("userId", userId!!)
                                            .addFormDataPart("deviceId", deviceId!!)
                                            .addFormDataPart("file", generateRandomString(8)+file.name, RequestBody.create(
                                                "application/octet-stream".toMediaTypeOrNull(), file))
                                            .build()

                                        val request = Request.Builder()
                                            .url("https://copy-n-sync-backend.vercel.app/upload")
                                            .post(requestBody)
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

                                                val completionNotification = NotificationCompat.Builder(context, "Copy n Sync")
                                                    .setContentTitle("Upload Complete")
                                                    .setContentText("You just uploaded a File")
                                                    .setSmallIcon(R.drawable.notify)
                                                    .build()
                                                NotificationManagerCompat.from(context).notify(6, completionNotification)

                                                call.cancel()
                                            }
                                        })
                                    } catch (e: Exception){
                                        Log.d("Exception", e.toString())
                                    }
                                }
                            }
                            NotificationManagerCompat.from(context).cancel(6)

                        }
                    }
                }

            finish()
        }
    }
    fun generateRandomString(length: Int): String {
        val allowedChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
        return (1..length)
            .map { allowedChars.random() }
            .joinToString("")
    }

    @Throws(IOException::class)
    fun copyFileFromContentUri(uri: Uri, type: String): File? {

        val tempDir = applicationContext.getExternalFilesDir(null)
        val ext = type.split("/").last()
        if (tempDir != null) {

            val outputFile: File?
            val extSec = MimeTypeMap.getFileExtensionFromUrl(uri.toString())
            outputFile = if(extSec == ""){
                File(tempDir, "temp_file.$ext")
            } else {
                File(tempDir, "temp_file.$extSec")
            }

            val inputStream: InputStream? = applicationContext.contentResolver.openInputStream(uri)
            val outputStream = FileOutputStream(outputFile)

            if (inputStream != null) {
                try {
                    val buffer = ByteArray(1024)
                    var bytesRead: Int

                    while (inputStream.read(buffer).also { bytesRead = it } > 0) {
                        outputStream.write(buffer, 0, bytesRead)
                    }

                    return outputFile
                } finally {
                    inputStream.close()
                    outputStream.close()
                }
            }
        }

        return null
    }







}