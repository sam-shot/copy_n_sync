package com.copy.sync

import android.content.Context
import android.media.MediaScannerConnection
import android.media.MediaScannerConnection.MediaScannerConnectionClient


class MyMediaScanner(private val context: Context) {

    private val mediaScannerConnectionClient = object : MediaScannerConnectionClient {
        override fun onMediaScannerConnected() {
        }

        override fun onScanCompleted(path: String?, uri: android.net.Uri?) {
            disconnect()
        }
    }
    private var mediaScannerConnection: MediaScannerConnection = MediaScannerConnection(context, mediaScannerConnectionClient)
    fun connect() {
        mediaScannerConnection.connect()
    }

    fun disconnect() {
        mediaScannerConnection.disconnect()
    }

    fun scan() {

        val tempDir = context.getExternalFilesDir(null)
        mediaScannerConnection.scanFile(tempDir.toString(), null)
    }
}
