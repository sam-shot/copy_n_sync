package com.example.copy_n_sync

import android.app.AlertDialog
import android.os.Bundle

import android.content.Intent
import android.view.Window
import android.view.WindowManager
import android.widget.Toast
import com.divyanshushekhar.flutter_process_text.FlutterProcessTextPlugin
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.socket.client.IO
import io.socket.client.Socket
import io.socket.emitter.Emitter

class ContextMenu : FlutterActivity() {

    private val CHANNEL = "contextMenuChannel"
    private var methodChannel: MethodChannel? = null

    var selectedText : String? = null
    public override fun onCreate(savedInstanceState: Bundle?) {



        super.onCreate(savedInstanceState)
//        val issAppRunning: Boolean = MainActivity.getIsAppRunning()
        methodChannel = MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL)



//        setTheme(android.R.style.Theme_DeviceDefault_Dialog)
//        requestWindowFeature(Window.FEATURE_NO_TITLE)
//        window.setLayout(WindowManager.LayoutParams.WRAP_CONTENT, WindowManager.LayoutParams.WRAP_CONTENT)

        if(intent.action == Intent.ACTION_PROCESS_TEXT){
             selectedText = intent.getStringExtra(Intent.EXTRA_PROCESS_TEXT)
           Toast.makeText(context,"Textgg is: $selectedText",Toast.LENGTH_LONG).show()


        // TODO: i am going to create an activity that would be actual, bu tlike a dialog, then
        // attach it to a flutter activity, which will open a specific screens using the socket instsance,and voila!


        finish()
        }

    }


}