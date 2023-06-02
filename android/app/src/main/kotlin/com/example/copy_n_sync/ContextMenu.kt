package com.example.copy_n_sync

import android.os.Bundle
import com.divyanshushekhar.flutter_process_text.FlutterProcessTextPlugin
import com.example.copy_n_sync.MainActivity
import io.flutter.embedding.android.FlutterActivity

class ContextMenu : FlutterActivity() {
    public override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val issAppRunning: Boolean = MainActivity.getIsAppRunning()
        FlutterProcessTextPlugin.listenProcessTextIntent(issAppRunning)
    }
}