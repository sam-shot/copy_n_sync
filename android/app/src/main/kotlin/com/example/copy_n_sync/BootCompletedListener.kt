package com.example.copy_n_sync

import android.app.PendingIntent
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat

class BootCompletedListener : BroadcastReceiver() {
    override fun onReceive(context: Context?, intent: Intent?) {
        if (intent?.action == "android.intent.action.BOOT_COMPLETED") {
            val notificationIntent = Intent(context, CopyTextActivity::class.java)
            notificationIntent.flags = Intent.FLAG_ACTIVITY_NEW_TASK

            val pendingIntent = PendingIntent.getActivity(context, 0, notificationIntent, PendingIntent.FLAG_UPDATE_CURRENT)

            val notification = context?.let {
                NotificationCompat.Builder(it, "Sync Text")
                    .setContentTitle("Sync Across your Devices")
                    .setContentText("Tap here to send Copied Text")
                    .setSmallIcon(R.drawable.notify)
                    .setContentIntent(pendingIntent)
                    .setOngoing(true)
                    .setAutoCancel(false)
                    .build()
            }
            context?.let { notification?.let { it1 ->
                NotificationManagerCompat.from(it).notify(4,
                    it1
                )
            } }
        }
    }
}